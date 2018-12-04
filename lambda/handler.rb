require 'awesome_print'

def hello(event:, context:)
    ap event
    { "statusCode": 200, "body": "hello" }
end