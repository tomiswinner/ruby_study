n = gets.chomp.to_i
arr = []

n.times do |num|
  arr << gets.chomp.split.map!{|elem| elem.to_i}
end

target = gets.chomp.to_i
cnt = 0

arr.each do |elem|
  if target >= (arr[n-1].first - elem.first).abs + (arr[n-1].last - elem.last).abs
    cnt += 1    
  end
end

puts cnt