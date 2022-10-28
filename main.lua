local boredDataService = require "services.bored-data"
local utilsMenu = require "utils.menu"

local function main()
  local result = boredDataService.getRandomActivity()
  if (result.error) then
    error(result.error)
    return
  end

  print("Getting bored? Let's do this")
  if result and result.activity then
    print(result.activity)
  else
    print("Learn how to code a programming language")
  end

  local isStillBoring
  print("Still boring? (Y/n)")
  repeat
    isStillBoring = io.read();
    if isStillBoring == "Y" then
      utilsMenu.askMenu()
    end
    return
  until isStillBoring == "Y"
end

main()