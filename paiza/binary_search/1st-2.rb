def binary(arr, target)
  left = 0
  right = arr.length - 1
  while left <= right
    mid = (left + right) / 2
    if arr[mid] == target
      return true
    elsif arr[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end
  return false
end

n = gets.chomp.to_i

arr = gets.chomp.split.map!{|n| n.to_i}

q = gets.chomp.to_i

q.times do
  target = gets.chomp.to_i
  if binary(arr, target)
    puts 'Yes'
  else
    puts 'No'
  end
end

