Num_people, Len_song = gets.chomp.split.map!{|n| n.to_i}

arr_tone = []

Len_song.times do
  arr_tone << gets.chomp.to_i
end

max_score = 0

Num_people.times do
  score = 100
  arr_tone.each do |elem|
    this_tone = gets.chomp.to_i
    diff = (this_tone - elem).abs
    if diff > 30
      score -= 5
    elsif diff > 20
      score -= 3
    elsif diff > 10
      score -= 2
    elsif diff > 5
      score -= 1
    end
  end

  if max_score < score
    max_score = score
  end
end

puts max_score