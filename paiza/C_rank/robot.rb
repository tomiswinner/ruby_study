sec, rules = gets.chomp.split.map!{|n| n.to_i}

arr_rules = []

[*1..rules].each do |n|
  arr_rules.push(gets.chomp.split)  
end

[*1..sec].each do |n|
  letters = ""
  arr_rules.each do |m, val|
    letters += "#{val} " if n % m.to_i == 0
  end
  if letters.empty?
    puts n
  else
    puts letters.strip
  end
end