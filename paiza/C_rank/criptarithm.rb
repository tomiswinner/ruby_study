a,b = gets.chomp.split.map!{|n| n.to_i}

[*1..9].each do |x|
  [*0..9].each do |y|
    if (10 * x + y) * y == 100 * a + 10 * x + b
      puts "#{x} #{y}"
      return
    end
  end
end

puts 'No'