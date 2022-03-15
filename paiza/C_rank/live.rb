a_livedays = gets.chomp.to_i
a_livedates = []
a_livedays.times do
  a_livedates.push(gets.chomp.to_i)
end

b_livedays = gets.chomp.to_i
b_livedates = []
b_livedays.times do
  b_livedates.push(gets.chomp.to_i)
end

turn_A = true

[*1..31].each do |n|
  if n == a_livedates.first && n == b_livedates.first
    a_livedates.shift
    b_livedates.shift
    if turn_A
      puts 'A'
    else
      puts 'B'
    end
    turn_A = !turn_A
  elsif n == a_livedates.first
    a_livedates.shift
    puts 'A'
  elsif n == b_livedates.first
    b_livedates.shift
    puts 'B'
  else
    puts 'x'
  end
end