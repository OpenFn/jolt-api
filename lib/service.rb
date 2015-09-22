require 'json'
require './lib/shifter'

post '/shift' do
  result = Shifter.process(params[:input], params[:spec])
  [200, {'Content-Type' => 'application/json'}, result.to_json]
end

