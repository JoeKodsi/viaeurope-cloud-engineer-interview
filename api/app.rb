require "sinatra"
require "redis"

REDIS_URL = ENV.fetch("REDIS_URL", "redis://localhost:6379/api")

redis = Redis.new(url: REDIS_URL)

get "/healthcheck" do
  "OK"
end

get "/" do
  content_type :json

  last_sum = redis.get("sum") || 0
  {last_sum:}.to_json
end

post "/sum" do
  content_type :json

  request.body.rewind
  data = JSON.parse(request.body.read)

  n = data["n"]

  logger.info "\"/sum\" #{data.inspect}"

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

  sum = slow_sum(n)
  redis.set("sum", sum)

  {sum:}.to_json
rescue
  halt 400, {error: "invalid json"}.to_json
end

def slow_sum(n)
  (0..n).inject(0, &:+)
end
