local generation = 0
while true do
  print("waiting for bees...")
  turtle.select(1)
  while not turtle.suck(1) do
    sleep(10)
  end
  generation = generation + 1
  print("breeding generation "..generation)
  while turtle.suck() do
  end
  for i = 1, 16 do
    local count = turtle.getItemCount(i)
    if count > 0 then
      turtle.select(i)
      if count > 1 then
        turtle.dropUp(turtle.getItemCount(i)-1)
      end
      turtle.drop()
      if turtle.getItemCount(i) > 0 then
        turtle.dropUp()
      end
    end
  end
end
