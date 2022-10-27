local boredDataService = require "services.bored-data"

function main()
  local result = boredDataService.getRandomActivity()
  print(result)
end

main()