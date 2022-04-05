require "stringio"

# $stdin = StringIO.new("10
# 45 62 11 81 75 90 13 2 97 32
# 5
# 90
# 75
# 50
# 1
# 63")

def binary(arr, tar)
  # target < arr[n] なら合格であり、この最小値を見つける
  failed = 0
  passed = arr.length
  while failed < passed
    mid = (failed + passed) / 2
    if tar < arr[mid]
      passed = mid
    else
      failed = mid + 1
    end
  end
  return failed
end

def bin(arr, tar)
  left = 0
  right = arr.length
  while left < right
    mid = (left + right) / 2
    if arr[mid] <= tar
      left = mid + 1
    else
      right = mid
    end
  end
  return right
end

n_student = gets.chomp.to_i
arr_scores = gets.chomp.split.map!{|n| n.to_i}
arr_scores.sort!

n_qp = gets.chomp.to_i

n_qp.times do
  qp = gets.chomp.to_i
  puts "#{n_student - binary(arr_scores, qp)}"
end
# $stdin = STDIN
