num_vertex = gets.chomp.to_i

dot_arr = []

num_vertex.times do
  dot_arr << gets.chomp.split.map!{|n| n.to_i}
end

x_s, x_t = gets.chomp.split.map!{|n| n.to_i}
y_s, y_t = gets.chomp.split.map!{|n| n.to_i}

cnt = 0

dot_arr.each do |elem|
  if (x_s <= elem.first && elem.first <= x_t) && (y_s <= elem.last && elem.last <= y_t)
    cnt += 1
  end
end

puts cnt