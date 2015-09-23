require './lib/shifter'

before do
  request.body.rewind
  @request_payload = JrJackson::Json.load request.body.read
end

post '/shift' do
  specs = @request_payload['specs']
  input = @request_payload['input']

  chainr = Chainr.fromSpec(specs)
  result = chainr.transform(input)
  
  [200, {'Content-Type' => 'application/json'}, JrJackson::Json.dump(result)]
end
