require "stringio"
$stdin = StringIO.new("7 10 9
5 2
#...#.....
.###...#.#
#..#....##
.#.###..##
##.....###
##.##....#
#..#.##..#")

h, w, n = gets.chomp.split.map!{|n| n.to_i}
y,x = gets.chomp.split.map!{|n| n.to_i}

len = Array.new(h) { Array.new(w, -1)}
grid = []

h.times do |i|
  grid[i] = gets.chomp.chars
end

q = []
q.unshift([y,x])
len[y][x] = 0
grid[y][x] = '*'

while !q.empty?
  now = q.pop()
  ny = now.first
  nx = now.last
  
  if len[ny][nx] == n
    next
  end
  
  for i in [1, -1] do
    if 0 <= ny + i && ny + i < h && grid[ny + i][nx] == '.' && grid[ny + i][nx] != '#'
      q.unshift([ny + i, nx])
      len[ny + i][nx] = len[ny][nx] + 1
      grid[ny + i][nx] = '*'
    end
    if 0 <= nx + i && nx + i < w && grid[ny][nx + i] == '.' && grid[ny][nx + i] != '#'
      q.unshift([ny, nx + i])
      len[ny][nx + i] = len[ny][nx] + 1
      grid[ny][nx + i] = '*'
    end
  end
end

grid.each {|elem| puts elem.join ''}