require "stringio"

$stdin = StringIO.new("10
                      -45 62 -11 81 75 -90 13 2 97 -32
                      5
                      -30 65
                      -90 -90
                      -15 85
                      -50 50
                      -10 -1")
# l_i <= の最小値
def ubound(arr, tar)
  left_ng = -1
  right_ok = arr.length - 1 
  if arr[right_ok] < tar
    return right_ok + 1
  end
  while (left_ng - right_ok).abs > 1
    mid = (left_ng  + right_ok) / 2
    if tar <= arr[mid]
      right_ok = mid
    else
      left_ng = mid
    end
  end
  return right_ok
end

#r_i >= の最大値を求める
def lbound(arr, tar)
  left_ok = 0
  right_ng = arr.length
  if tar < arr[left_ok]
    return left_ok
  end
  while (left_ok - right_ng).abs > 1
    mid = (left_ok + right_ng) / 2
    if arr[mid] <= tar
      left_ok = mid
    else
      right_ng = mid
    end
  end
  return right_ng
end

n = gets.chomp.to_i

arr_A = gets.chomp.split.map!{|n| n.to_i}

arr_A.sort!

q = gets.chomp.to_i

q.times do
  tar_lower, tar_upper = gets.chomp.split.map!{|n| n.to_i}
  l_num = ubound(arr_A, tar_lower)
  u_num = lbound(arr_A, tar_upper)
  puts u_num - l_num
end
