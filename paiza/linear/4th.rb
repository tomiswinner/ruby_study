n = gets.chomp.to_i
arr = gets.chomp.split.map!{|n| n.to_i}
target = gets.chomp.to_i

index = []
last_value = 0

while true do
  i = arr.find_index(target)
  break if i.nil?
  index.push(i + last_value + 1)
  last_value = index.last
  arr = arr.slice(i + 1,arr.length)
end

index.each do |n|
  puts n
end
