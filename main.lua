local boredDataService = require "services.bored-data"
local utilsMenu = require "utils.menu"
local utilsMisc = require "utils.misc"


local function main()
  local function errorHandler(error)
    print("ERROR: ", error)
  end

  local status, result = xpcall(boredDataService.getRandomActivity, errorHandler)
  print("Getting bored? Let's do this")
  if result and result.activity then
    print(result.activity)
  else
    print("Learn how to code a programming language")
  end

  local anwser
  print("Still boring? (Y/n)")
  repeat
    anwser = io.read();
    if utilsMisc.isYes(anwser) then
      utilsMisc.clear();
      utilsMenu.askMenu()
    end
    return
  until utilsMisc.isYes(anwser)
end
print(package.config:sub(1,1))

main()
