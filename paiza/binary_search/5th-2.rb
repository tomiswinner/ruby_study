require "stringio"

$stdin = StringIO.new("5 12
                      5 9 7 6 7")

n, k = gets.chomp.split.map!{|n| n.to_i}

arr_A = gets.chomp.split.map!{|n| n.to_i}
arr_A.sort!
#print "arr:#{arr_A}\n"
#puts "k: #{k}"

left_ok = 0.to_f
right_ng = 10001.to_f
100.times do
  mid = (left_ok + right_ng) / 2
  cnt = 0
  n.times do |i|
    cnt += (arr_A[i] / mid).to_i
  end
  if k <= cnt
    left_ok = mid
  else
    right_ng = mid
  end
  #puts "cnt:#{cnt}"
  #puts "ok:#{right_ng}, ng:#{left_ok}, mid:#{mid}"
end
puts left_ok
