require 'awesome_print'

#wafflesabc
def hello(event:, context:)
    ap event
    ap 'test1'
    { "statusCode": 200, "body": "hello" }
end