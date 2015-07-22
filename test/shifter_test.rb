require 'minitest/autorun'
require 'lib/shifter'

class ShifterTest < Minitest::Test

  def test_transformation
    input = %Q[
      {
        "rating": {
          "primary": {
            "values": 3
          },
          "quality": {
            "values": 3
          }
        }
      }
    ]

    spec = %Q[
      [
        {
          "operation": "shift",
          "spec": {
            "rating": {
              "primary": {
                "values": "Rating"
              },
              "*": {
                "values": "SecondaryRatings.&1.Value",
                "$": "SecondaryRatings.&.Id"
              }
            }
          }
        },
        {
          "operation": "default",
          "spec": {
            "Range" : 5,
            "SecondaryRatings" : {
              "*" : {
                "Range" : 5
              }
            }
          }
        }
      ]
    ]

    desired_output = {"Rating"=>3, "SecondaryRatings"=>{"quality"=>{"Id"=>"quality", "Value"=>3, "Range"=>5}}, "Range"=>5}

    assert_equal desired_output, ::Shifter.process(input, spec)
  end
end
