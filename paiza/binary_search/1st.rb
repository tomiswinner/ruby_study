def binary_search(array, arr_length, target_num)
  left_edge = 0
  right_edge = arr_length - 1
  
  while left_edge <= right_edge
    mid = (left_edge + right_edge) / 2
    if array[mid] == target_num
      return true
    elsif array[mid] < target_num
      left_edge = mid + 1
    else
      right_edge = mid - 1
    end
  end
  return false
end

n = gets.chomp.to_i
arr = gets.chomp.split.map!{|n| n.to_i}
q = gets.chomp.to_i
q.times do 
  target = gets.chomp.to_i
  if binary_search(arr, n, target)
    puts 'Yes'
  else
    puts 'No'
  end
end
