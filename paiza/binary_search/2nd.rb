# score > qp となる最小のscoreを探す
def binary_search(array, len_arr, qp)
  left = 0
  right = len_arr
  while left < right
    mid = (left + right)/2
    if array[mid] < qp
      # 逆だと動かない
      # しっかり確認
      left = mid + 1
    else
      right = mid 
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


