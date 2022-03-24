n = gets.chomp.to_i
arr = gets.chomp.split.map!{|n| n.to_i}
target = gets.chomp.to_i

arr.sort!

arr.each_with_index do |elem, i|
  if elem >= target
    arr = arr[i..]
    break
  end
end

puts arr.min
