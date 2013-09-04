while true do
  while turtle.suckUp() do
  end
  for i = 1, 16 do
    if turtle.getItemCount(i) > 1 then
      turtle.select(i)
      turtle.dropDown(turtle.getItemCount(i) - 1)
    end
  end
  sleep(1)
end