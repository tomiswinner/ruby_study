n = gets.chomp.to_i
values = gets.chomp.split.map!{|val| val.to_i}
target = gets.chomp.to_i

location = values.find_index(target)

if !location.nil?
  puts location + 1
else
  puts 0
end