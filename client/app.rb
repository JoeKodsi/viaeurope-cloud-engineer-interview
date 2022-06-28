require "sinatra"
require "net/http"

DB_FILE = "#{ENV.fetch("DB_FILE", "db")}/db_file"
SERVER_URI = URI(ENV.fetch("SERVER_URL", "127.0.0.1:4567"))

get "/" do
  n = params["n"]&.to_i

  if n
    sum = calculate_sum(n)
    write_to_db!(sum)
    "Your sum was #{sum}"
  else
    "Last sum was #{get_sum}"
  end
end

get "/healthcheck" do
  "OK"
end

get "/logs" do
  File.read(DB_FILE)
end

def get_sum
  response = Net::HTTP.get_response(SERVER_URI, {"Content-Type" => "application/json"})
  body = JSON.parse(response.body)
  body["last_sum"]
end

def calculate_sum(n)
  response = Net::HTTP.post(URI("#{SERVER_URI}/sum"), {n:}.to_json, "Content-Type" => "application/json")
  body = JSON.parse(response.body)

  if body["error"]
    raise "Something went wrong"
  else
    body["sum"]
  end
end

def write_to_db!(line)
  File.write(DB_FILE, "#{line}\n", mode: "a")
end