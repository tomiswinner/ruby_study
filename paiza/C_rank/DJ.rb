want, min, sec = gets.chomp.split.map!{|n| n.to_i}
having_time = min * 60 + sec

arr_song_times = []

[*1..want].each do |song|
  s_min, s_sec = gets.chomp.split.map!{|n| n.to_i}
  arr_song_times.push(s_min * 60 + s_sec)
end

arr_song_times.sort!
val = 0

arr_song_times.each_with_index do |elem, i|
  val += elem
  if val > having_time
    puts i
    return 
  end
end

puts arr_song_times.length

