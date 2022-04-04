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
  # qp 以上となる最小値を見つける = qp未満となる最大値を見つける
  ng = 0
  ok = arr.length - 1
  # puts "left: #{arr[ng]}"
  # puts "right: #{arr[ok]}"
  # puts "tar:#{tar}"

  # ↓の場合、最後ng=1 となってしまうのではじく
  if  tar < arr[ng]
    return ng
  # ↓の場合、最後ng = 10となってしまうので
  elsif arr[ok] 
    
  end

  while ok - ng > 1
    mid = (ok + ng) / 2
    # tar が mid 未満なら、mid は ng に含まれる
    if tar < arr[mid]
      ok = mid
      #tar が mid 以上なら、その mid は ok に含まれる
    else
      ng = mid
    end
    # puts "ng:#{arr[ng]}, ok:#{arr[ok]}"
  end
  return ng + 1
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
