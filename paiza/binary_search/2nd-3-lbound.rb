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
  left_ng = -1
  right_ok = arr.length - 1
#  print "arr;#{arr}\n"
#  puts "tar:#{tar}"
  if arr[right_ok] < tar
    return right_ok + 1
  end
  while (right_ok - left_ng) > 1
    mid = (right_ok + left_ng) / 2
    if arr[mid] < tar
      left_ng = mid
    else
      right_ok = mid
    end
  end
 
#  puts "ok:#{right_ok}, ng:#{left_ng}, mid:#{arr[mid]}"
  return right_ok
end

n = gets.chomp.to_i

arr_A = gets.chomp.split.map!{|n| n.to_i}
arr_A.sort!

q = gets.chomp.to_i

q.times do
  qualified_pts = gets.chomp.to_i
  puts "#{n - binary(arr_A,qualified_pts)}"
end
