require 'json'
require './lib/shifter'

post '/shift' do
  Shifter.process(params[:input], params[:spec])
end

