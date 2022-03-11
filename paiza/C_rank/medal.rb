players = gets.chomp
scores = gets.chomp.split.map!{ |n| n.to_i}
ranking = scores.sort.reverse!

scores.each do |score|
  # find_index は最初に見つけたindexを返す
  rank = ranking.find_index(score)
  puts "G" if rank == 0
  puts "S" if rank == 1
  puts "B" if rank == 2
  puts "N" if rank > 2
end