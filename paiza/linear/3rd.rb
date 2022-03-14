n = gets.chomp.to_i
values = gets.chomp.split.map!{|n| n.to_i}
target = gets.chomp.to_i

index = values.reverse!.find_index(target)


if !index.nil?
  puts n - index 
else
  puts 0
end


