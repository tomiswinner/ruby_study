require "stringio"

$stdin = StringIO.new("23 5 7
2 6 9 10 12 15 19")

L, n, k = gets.chomp.split.map!{|n| n.to_i}

arr_breaks = gets.chomp.split.map!{|n| n.to_i}

arr_breaks << L

arr_breaks.unshift(0)

left = 1
right = L

(arr_breaks.length-1).times do |i|
  left = [left, arr_breaks[i+1] - arr_breaks[i]].max
end
puts "left:#{left}"

while (left - right).abs > 1
  mid = (left + right) / 2
  last_index, index, parts = 0, 0, 0
  while true
    while index + 1 < arr_breaks.length && arr_breaks[index+1] - arr_breaks[last_index] <= mid
      index += 1
      # puts "index:#{index}"
    end
    parts += 1
    if index == arr_breaks.length - 1
      break
    end
    last_index = index
  end
  # puts "parts:#{parts}"
  if parts > n
    left = mid
  else
    right = mid
  end
  # puts "left#{left},right:#{right},mid#{mid}"
end

puts right