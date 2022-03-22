n = gets.chomp.to_i

arr = gets.chomp.split.map!{|n| n.to_i}

puts "#{arr.max} #{arr.min}"