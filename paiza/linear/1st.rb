length = gets.chomp.to_i
values = gets.chomp.split.map!{|n| n.to_i}
target = gets.chomp.to_i

count = 0

values.each { |value|
  count += 1 if value == target
}

puts count