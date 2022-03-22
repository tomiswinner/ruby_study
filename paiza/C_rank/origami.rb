Maisu, Length = gets.chomp.split.map!{|n| n.to_i}

horizontal_length = Length


(Maisu-1).times do |n|
  overlapped = gets.chomp.to_i
  horizontal_length += Length - overlapped
end

puts horizontal_length * Length




