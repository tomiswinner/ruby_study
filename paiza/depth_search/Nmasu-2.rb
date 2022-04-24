# FIFO を使う幅優先探索

require "stringio"
$stdin = StringIO.new("10 7 10
6 1")

height, width, n = gets.chomp.split.map!{|n| n.to_i}
y,x  = gets.chomp.split.map!{|n| n.to_i}

grid = Array.new(height) { Array.new(width, '.') }
len = Array.new(height) { Array.new(width, -1)}

p len.map {|e| e.join ','}

queue = []

queue << [y, x]

len[y][x] = 0
grid[y][x] = '*'
# print "grid:#{grid}\n"

while !(queue.empty?)

  now = queue.pop
  # print "now#{now}\n"
  # print "queue#{queue}\n"
  ny = now.first
  nx = now.last
  if len[ny][nx] == n
    next;
  end
  for i in [-1, 1] do
    # puts "i:#{i}"
    # puts "ny:#{ny}"
    # puts "nx:#{nx}"
    # puts "grid[ny][nx]:#{grid[ny+i][nx]}"

    if 0 <= ny + i && ny + i < height && grid[ny + i][nx] == '.'
      queue << [ny + i, nx]
      # print "add ny: #{queue}\n"
      len[ny + i][nx] = len[ny][nx] + 1
      grid[ny + i][nx] = '*'
    end
    
    if 0 <= nx + i && nx + i < width && grid[ny][nx + i] == '.'
      queue << [ny, nx + i]
      # もともといたマスの len から + 1 する
      len[ny][nx + i] = len[ny][nx] + 1
      # print "add ny: #{queue}\n"
      grid[ny][nx + i] = '*'
    end
  end
end

#   grid.each do |grid2| 
#    grid2.each do |i| 
#      print i
#    end
#    print "\n"
#  end
