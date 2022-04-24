# FIFO を使う幅優先探索

require "stringio"
$stdin = StringIO.new("6 2
2 0")

height, width = gets.chomp.split.map!{|n| n.to_i}
y,x  = gets.chomp.split.map!{|n| n.to_i}

grid = Array.new(height) { Array.new(width, '.') }
len = Array.new(height) { Array.new(width, -1)}

queue = []

queue << [y, x]

len[y][x] = 0
grid[y][x] = '*'
# print "grid:#{grid}\n"

while !queue.empty?

  now = queue.pop
  # print "now#{now}\n"
  # print "queue#{queue}\n"
  ny = now.first
  nx = now.last
  if len[ny][nx] == 3
    next;
  end
  for elem in [-1, 1] do
    # puts "elem:#{elem}"
    # puts "ny:#{ny}"
    # puts "nx:#{nx}"
    # puts "grid[ny][nx]:#{grid[ny+elem][nx]}"

    if 0 <= ny + elem && ny + elem < height && grid[ny + elem][nx] == '.'
      queue << [ny + elem, nx]
      # print "add ny: #{queue}\n"
      len[ny + elem][nx] = len[ny][nx] + 1
      grid[ny + elem][nx] = '*'
    end
    
    if 0 <= nx + elem && nx + elem < width && grid[ny][nx + elem] == '.'
      queue << [ny, nx + elem]
      # もともといたマスの len から + 1 する
      len[ny][nx + elem] = len[ny][nx] + 1
      # print "add ny: #{queue}\n"
      grid[ny][nx + elem] = '*'
    end
    puts "ny, nx: #{ny},#{nx}"
  end
end

  grid.each do |grid2| 
   grid2.each do |elem| 
     print elem
   end
   print "\n"
 end
