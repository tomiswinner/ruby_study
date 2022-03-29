kg, percent1, percent2 = gets.chomp.split.map!{|n| n.to_i}

leftover = kg * (100 - percent1) * (100 - percent2) * 0.01 * 0.01

puts leftover