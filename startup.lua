if not turtle then
  return
end

local turtleCount = {}
if fs.exists("disk/turtle_count") then
  local f = fs.open("disk/turtle_count", "r")
  turtleCount = textutils.unserialize(f.readAll())
  f.close()
end

extraTurtles = {
  "beekeeper",
  "hopper",
}

term.clear()
print("Please select the type of turtle to install:")
for i, turtleType in ipairs(extraTurtles) do
  print("  "..tostring(i).." "..turtleType.." ("..tostring(extraTurtles[turtleType] or 0)..")")
end

local selection
while true do
  print("Enter number: ")
  read()
  selection = tonumber(read())
  if selection and extraTurtles[selection] then
    break
  end
end
local turtleType = extraTurtles[selection]

if turtleCount[turtleType] then
  turtleCount[turtleType] = turtleCount[turtleType] + 1
else
  turtleCount[turtleType] = 1
end

fs.copy("disk/"..turtleType, "startup")
os.setComputerLabel(turtleType..tostring(turtleCount))

local f = fs.open("disk/turtle_count", "w")
f.write(textutils.serialize(turtleCount))
f.close()
