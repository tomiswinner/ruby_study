# require "stringio"

# $stdin = StringIO.new("10
# -45 62 -11 81 75 -90 13 2 97 -32
# 7
# -30 65
# -90 -90
# -15 85
# -50 50
# -10 -1
# -11 2
# -11 1")

def binary_min(arr, tar)
  ng = -1
  ok = arr.length - 1
  while (ok - ng).abs > 1
    mid = (ok + ng) / 2
    if tar <= arr[mid]
      ok = mid
    else
      ng = mid
    end
  end
  return ok
end

def binary_max(arr, tar)
  ok = 0
  ng = arr.length
  while (ng - ok).abs > 1
    mid = (ng + ok) / 2
    if arr[mid] <= tar
      ok = mid
    else
      ng = mid
    end
  end
  return ok
end


arr_len = gets.chomp.to_i

arr = gets.chomp.split.map!{|n| n.to_i}
arr.sort!

n_couples = gets.chomp.to_i

n_couples.times do 
  target = gets.chomp.split.map!{|n| n.to_i}  
  if target.last < arr.first || arr.last < target.first
    puts 0
    next
  end
  min_index = binary_min(arr, target.first)
  max_index = binary_max(arr, target.last) + 1
  # print "#{target}\n"
  # puts "min:#{min_index},max:#{max_index}"
  puts "#{max_index - min_index}"
  # print "#{arr}\n"
end
