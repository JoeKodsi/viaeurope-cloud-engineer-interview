require "sinatra"

get "/" do
  content_type :json

  {greeting: "Hello world."}.to_json
end

post "/sum" do
  content_type :json

  request.body.rewind
  data = JSON.parse(request.body.read)

  n = data["n"]

  if n.nil?
    halt 422, {error: "n needs to be set"}.to_json
  end

  unless n.is_a?(Integer)
    halt 422, {error: "n needs to be an integer"}.to_json
  end

  if n < 1
    halt 422, {error: "n needs to be greater 0"}.to_json
  end

  if n == 13
    Sinatra::Application.quit! # Crash and burn
  end

  {sum: slow_sum(n)}.to_json
rescue
  halt 400, {error: "invalid json"}.to_json
end

def slow_sum(n)
  (0..n).inject(0, &:+)
end
