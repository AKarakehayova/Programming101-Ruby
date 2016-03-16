def points(current_x, current_y, direction)
  array = direction.split("").to_a
  length = array.length
  warp, current = false, 0
  while current < length
    if array[current] == ">" && !warp
      current_x += 1
    elsif array[current] == "<" && !warp
      current_x -= 1
    elsif array[current] == "^" && !warp
      current_y -= 1
    elsif array[current] == "v" && !warp
      current_y += 1
    elsif array[current] == "~" && !warp
      warp=true
    elsif array[current] == "~" && warp
      warp=false
    elsif array[current] == ">" && warp
      current_x -= 1
    elsif array[current] == "<" && warp
      current_x += 1
    elsif array[current] == "^" && warp
      current_y += 1
    elsif array[current] == "v" && warp
      current_y -= 1
    end
    current += 1
  end
  result=Array.new<<current_x<<current_y
end