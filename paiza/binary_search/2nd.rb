# score > qp となる最小のscoreを探す
def binary_search(array, len_arr, qp)
  left = 0
  right = len_arr
  while left < right
    mid = (left + right)/2
    if qp < array[mid]
      right = mid 
    elsif array[mid] < qp
      left = mid + 1
    end
  end
  return right.to_i
end

Num_students  = gets.chomp.to_i

arr_score = gets.chomp.split.map!{|n| n.to_i}
arr_score.sort!

Num_qp = gets.chomp.to_i

Num_qp.times do
  target =  gets.chomp.to_i
  puts "#{Num_students - binary_search(arr_score, Num_students, target)}"
end


