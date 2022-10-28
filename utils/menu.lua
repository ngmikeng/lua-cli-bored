local utilsMisc = require "utils.misc"

local function askSumRange()
  local isValidNumber = function (value)
    local num = tonumber(value)
    if (type(num) =="number") then
      return true
    end
    return false
  end
  
  local startValue, endValue, total
  repeat
    print("Please input a start value number: ")
    startValue = tonumber(io.read())
  until isValidNumber(startValue)

  repeat
    print("Please input an end value number (larger than start value): ")
    endValue = tonumber(io.read())
  until isValidNumber(endValue) and endValue > startValue
  
  total = utilsMisc.sumRange(startValue, endValue)
  print(string.format("Summarize values from %s to %s = %s", startValue, endValue, total))
end

local function askOpenFile()
  local filePath, file
  repeat
    print("Please input a file path: ")
    filePath = io.read()
    file = io.open(filePath, "r")
    if (file) then
      print("Three lines of the file are: ")
      print(file:read())
      print(file:read())
      print(file:read())
      file:close()
    end
  until filePath and file
end

local function askMenu()
  
  local function retry()
    local input
    repeat
      print("Do want to continue? Y/n")
      input = io.read()
    until input == "Y" or input == "n"
    return input
  end

  local option
  local isCorrectOption = false;
  local isRetry = false
  repeat
    print("***")
    print("Please input a number for selecting an option below")
    print("================================")
    print("1. Summarize values in a range")
    print("2. Try open a file")
    print("================================")
    option = io.read()
    if option == "1" then
      askSumRange()
      isCorrectOption = true
      isRetry = retry() == "Y"
    elseif option == "2" then
      askOpenFile()
      isCorrectOption = true
      isRetry = retry() == "Y"
    end  
  until isCorrectOption == true and isRetry == false
end

return {
  askMenu = askMenu
}