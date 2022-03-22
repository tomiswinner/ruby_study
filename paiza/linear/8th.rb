n = gets.chomp.to_i

arr = gets.chomp.split.map!{|n| n.to_i}

arr.each_with_index do |elem, i|
  if elem % 2 == 0
    puts i + 1
    return 
  end
end