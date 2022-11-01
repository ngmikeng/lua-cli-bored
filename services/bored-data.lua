local http_request = require "http.request"
local env = require "config.env"
local json = require "lib.json"

local function getRandomActivity()
  local headers, stream = assert(http_request.new_from_uri(env.apiUrl .. "/activity"):go())
  local body = assert(stream:get_body_as_string())
  if headers:get ":status" ~= "200" then
    error(body)
  end
  local json_data = json.decode(body);
  return json_data
end

return {
  getRandomActivity = getRandomActivity
}