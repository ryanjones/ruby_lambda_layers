require 'ap'

def hello(event:, context:)
    ap 'test'
    ap 'test1'
    { "statusCode": 200, "body": "i am a body" }
end