require './lib/shifter'

post '/shift' do
  request.body.rewind
  @request_payload = JrJackson::Json.load request.body.read

  specs = @request_payload['specs']
  input = @request_payload['input']

  begin
    chainr = Chainr.fromSpec(specs)
    result = chainr.transform(input)
  rescue Java::ComBazaarvoiceJoltException::SpecException => e
    puts e.inspect
    return [
      400,
      {'Content-Type' => 'application/json'},
      JrJackson::Json.dump({ error: e.message })
    ]
  end
  
  [200, {'Content-Type' => 'application/json'}, JrJackson::Json.dump(result)]
end
