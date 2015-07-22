require 'json'
require 'lib/shifter'

post '/shift' do
  Shifter.process(params[:input], params[:spec])
end

# Specs:
#"[{"rating": {"primary": {"value": "Rating"}, "*": { "value": "SecondaryRatings.&1.Value", "$": "SecondaryRatings.&.Id" }}}}, { "operation": "transform", "spec": {"Range": 5,"SecondaryRatings": { "*": { "Range": 5 }}}}]"

#"[ { "operation": "shift", "spec": { "Photos": { "*": { "Id": "photo-&1-id", "Caption": "photo-&1-caption", "Url": "photo-&1-url" } } } } ]"

# Inputs:
#"{\"rating\": {\"primary\": {\"value\": 3 }, \"quality\": {\"value\": 3}}}"


