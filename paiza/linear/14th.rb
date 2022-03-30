num_students = gets.chomp.to_i

arr = []

num_students.times do 
  arr << gets.chomp.split
end

qp_bottom, qp_top = gets.chomp.split.map!{|n| n.to_i}

arr.each do |elem|
  if qp_bottom <= elem.last.to_i && elem.last.to_i <= qp_top
    puts elem.first
  end
end