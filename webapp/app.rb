require "sinatra"

get "/" do
  content_type :json

  {greeting: "Hello world."}.to_json
end
