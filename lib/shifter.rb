require 'java'
require 'json'
Dir["*.jar"].each { |jar| require jar }

java_import 'com.bazaarvoice.jolt.Shiftr'
java_import 'com.bazaarvoice.jolt.Chainr'

class Shifter 
  def self.process raw_input, raw_spec
    # Get Spec from params
    spec = JSON.parse(raw_spec)

    # Create chainr object from spec
    chainr = Chainr.fromSpec(spec)

    # Get input JSON
    input = JSON.parse(raw_input)

    chainr.transform(input).to_hash
  end
end

