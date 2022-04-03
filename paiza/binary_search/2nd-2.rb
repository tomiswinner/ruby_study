def binary(arr, target)
  left = 0
  right = arr.length
  while left < right
    mid = (left + right) / 2
    if target > arr[mid]
      left = mid + 1
    else
      right = mid
    end
  end
  return right.to_i
end

n = gets.chomp.to_i
arr_scores = gets.chomp.split.map!{|n| n.to_i}
arr_scores.sort!

n_qp = gets.chomp.to_i

n_qp.times do 
  qp = gets.chomp.to_i
  puts "#{n - binary(arr_scores, qp)}"
end


