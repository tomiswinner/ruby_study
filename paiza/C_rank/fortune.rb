number = gets.chomp
cnt = 0

[*0..364].each do |n|
  if n.to_s.include?(number)
    cnt += 1
  end
end

puts cnt

