local http_request = require "http.request"
local env = require "config.env"
local json = require "lib.json"

function getRandomActivity()
  print("Getting bored? Let's do this")
  local headers, stream = assert(http_request.new_from_uri(env.apiUrl .. "/activity"):go())
  local body = assert(stream:get_body_as_string())
  local json_data = json.decode(body);
  if headers:get ":status" ~= "200" then
    error(body)
  end
  print(json_data["activity"])
end

return {
  getRandomActivity = getRandomActivity
}