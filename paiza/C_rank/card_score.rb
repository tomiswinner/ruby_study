num = gets.chomp.to_i
cards = gets.chomp.split.map!{|card| card.to_i}
cards.sort!

last_max_score = 0

total = 0
def max_score(value, i, cards)
  return value unless value + 1 == cards[i + 1]
  return max_score(value + 1, i + 1, cards)
end

cards.each_with_index do |value,i|
  next unless last_max_score < value 
  group_max = max_score(value, i, cards)
  last_max_score = group_max
  total += group_max
end

puts total
