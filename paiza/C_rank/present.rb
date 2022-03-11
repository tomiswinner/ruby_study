input = gets.chomp.split.map!{ |num| num.to_i}


[*1..input[0]].each do |n|
  result = ""
  if n % input[1] == 0
    result += "A"
  end
  if n % input[2] == 0
    result += "B"
  end
  if result == ""
    result = "N"
  end
  puts result
end
