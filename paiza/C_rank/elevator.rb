n = gets.chomp.to_i
floors = []

n.times do
  floors << gets.chomp.to_i
end

distance = 0
floor_now = 1

floors.each do |elem|
  distance += (floor_now - elem).abs
  floor_now = elem
end

puts distance
