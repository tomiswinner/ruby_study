require "stringio"
$stdin = StringIO.new("10
45 62 11 81 75 90 13 2 97 32
5
90
75
50
1
63")

def binary(arr, tar)
# k < となる点数の最小を求める=失敗人数
  left_ng = -1
  right_ok = arr.length - 1  
  if arr[right_ok] <= tar
    return right_ok + 1
  end
  while (left_ng - right_ok).abs > 1
    mid = (left_ng + right_ok) / 2
    if tar < arr[mid]
      right_ok = mid
    else
      left_ng = mid
    end
  end
  return right_ok
end

n = gets.chomp.to_i

arr_A = gets.chomp.split.map!{|n| n.to_i}
arr_A.sort!

q = gets.chomp.to_i

q.times do
  k = gets.chomp.to_i
  puts "#{n - binary(arr_A, k)}"
end
