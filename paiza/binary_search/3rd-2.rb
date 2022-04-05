# require "stringio"

# $stdin = StringIO.new("10
# 45 62 11 81 75 90 13 2 97 32
# 5
# 90
# 75
# 50
# 1
# 63")

# 閉区間でとくver
# left を返すので、arr[right] <= tar の場合、left の値はright -1 が返るので調整する
def binary(arr, tar)
  left = 0
  right = arr.length - 1
  if arr[right] <= tar
    return arr.length
  end

  while left <= right
    mid = (left + right) / 2
    if tar < arr[mid]
      right = mid - 1
    else
      left = mid + 1
    end
  end
  return left
end

n_student = gets.chomp.to_i
arr_scores = gets.chomp.split.map!{|n| n.to_i}
arr_scores.sort!

n_qp = gets.chomp.to_i

n_qp.times do
  qp = gets.chomp.to_i
  puts "#{n_student - binary(arr_scores, qp)}"
end

