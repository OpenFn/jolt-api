# Jolt API

**Still work in progress**

REST API around [Jolt](https://github.com/bazaarvoice/jolt). If you are unfamiliar
with Jolt, head over to their repo and check it out.

## Endpoints

### /shift

Endpoint: ```/shift```

Params:
- ```spec``` is the spec
- ```input``` is the input JSON

Accepts JSON input and spec. Returns the transformed JSON as a result.

**Example**

By sending the input:
```js
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
```

and the spec:
```js
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
```

The API will return:

```js
{
  "Rating": 3,
  "Range": 5,
  "SecondaryRatings": {
    "quality": {
      "Id": "quality",
      "Value": 3,
      "Range": 5
    }
  }
}
```

## Development

0. Clone this repo.
1. Run ```rbenv install``` to install the required jruby version.
2. Rehash rbenv just in case ```rbenv rehash```
3. Install bundler with ```jruby -S gem install bundler```.
4. Bundle install with ```jruby -S bundle install```.
5. Boot the server via ```rackup config.ru```.

## See it in action

You can see the API in action. Send a POST request to ```https://jolt-api.herokuapp.com/shift``` with
the required params and watch the magic happen.


