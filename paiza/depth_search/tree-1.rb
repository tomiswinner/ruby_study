require "stringio"
$stdin = StringIO.new("5 3
1 2
2 3
3 4
4 5")

n, x = gets.chomp.split.map!{|n| n.to_i}

graph = Array.new(n) { [] }

(n-1).times do |i|
  
  a, b = gets.chomp.split.map!{|n| n.to_i}
  a -= 1
  b -= 1
  graph[a] << b
  graph[b] << a
end



graph[x-1].sort!.each do |e|
  puts e + 1
end