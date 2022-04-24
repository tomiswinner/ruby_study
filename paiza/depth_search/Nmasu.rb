require "stringio"
$stdin = StringIO.new("10 7 10
6 1")

height, width, n = gets.chomp.split.map!{|n| n.to_i}

y, x = gets.chomp.split.map!{|n| n.to_i}

grid = Array.new(height) { Array.new(width, '.')}
len = Array.new(height) { Array.new(width, -1)}

queue = []
queue << [y,x]
len[y][x] = 0
grid[y][x] = '*'
# print "grid:#{grid}\n"

while !queue.empty?
  now = queue.pop
  now_y = now.first
  now_x = now.last
  puts "灼熱"
  # puts len.map{|e| e.join ' '}
  if len[now_y][now_x] == n
    next
  end

  for elem in [1, -1] do
    if 0 <= now_y + elem && now_y + elem < height && grid[now_y + elem][now_x] == '.'
      queue << [now_y + elem,now_x]
      grid[now_y + elem][now_x] = '*'
      puts "len:#{len[now_y][now_x]}"
      len[now_y + elem][now_x] = len[now_y][now_x] + 1
      puts "now_y, now_x: #{now_y + elem}, #{now_x}"
    end

    if 0 <= now_x + elem && now_x + elem < width && grid[now_y][now_x + elem] == '.'
      queue << [now_y, now_x + elem]
      grid[now_y][now_x + elem] = '*'
      puts "len:#{len[now_y][now_x]}"
      len[now_y][now_x + elem] = len[now_y][now_x] + 1
      puts "now_y, now_x: #{now_y}, #{now_x + elem}"
    end
  end
end

grid.each do |row|
  row.each do |elem|
    print elem
  end
  print "\n"
end