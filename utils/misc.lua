
local reduce = function (list, fn, init)
  local result = init
  for key, value in ipairs(list) do
    if key == 1 and not init then
      result = value
    else
      result = fn(result, value)
    end
  end
  return result
end

local function sumRange(startValue, endValue)
  local total
  local listNum = {}
  -- create list numbers
  for i = startValue, endValue, 1 do
    table.insert(listNum, i)
  end
  -- summarize values in the list numbers
  local sum = function (a, b)
    return a + b
  end
  total = reduce(listNum, sum)
  
  return total
end

local function isUnix()
  return package.config:sub(1,1) == "/"
end

local function clear()
  if isUnix() then
    os.execute("clear")
  else 
    os.execute("cls")
  end
end

local function isYes(value)
  return value and string.lower(value) == "y"
end

local function isNo(value)
  return value and string.lower(value) == "n"
end

return {
  reduce = reduce,
  sumRange = sumRange,
  isYes = isYes,
  isNo = isNo,
  clear = clear
}