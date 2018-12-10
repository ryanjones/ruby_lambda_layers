load_paths = Dir["/opt/ruby/gems/2.5.0/**/lib"]
$LOAD_PATH.unshift(*load_paths)

require 'rest-client'
require 'json'
require 'christmas' # loaded through /opt/ruby/lib

def hello(event:, context:)
  response = RestClient.get "https://jsonplaceholder.typicode.com/todos/#{1 + rand(50)}"
  payload = JSON.parse response.body
  song = Christmas.new.song
  
  {   
    "id": payload["id"],
    "title": payload["title"],
    "song": song
  }
end