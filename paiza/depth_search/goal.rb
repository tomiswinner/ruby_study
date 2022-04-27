h, w = gets.chomp.split.map!{|n| n.to_i}

sy, sx = gets.chomp.split.map!{|n| n.to_i} 
gy, gx = gets.chomp.split.map!{|n| n.to_i} 

grid = []
h.times do |i|
  grid[i] = gets.chars
end

q = []
q.unshift([sy, sx])
reachable = false

while !q.empty?
  now = q.pop()
  ny = now.first
  nx = now.last
  
  if ny == gy && nx == gx
    reachable = true
     break
  end
  
  for i in [1, -1] do
    if 0 <= ny + i && ny + i < h && grid[ny + i][nx] == '.' && grid[ny + i][nx] != '#'
      q.unshift([ny + i, nx])
      grid[ny + i][nx] = '*'
    end 

    if 0 <= nx + i && nx + i < h && grid[ny][nx + i] == '.' && grid[ny][nx + i] != '#'
      q.unshift([ny, nx + i])
      grid[ny][nx + i] = '*'
    end 
  end
end

if reachable
  puts 'Yes'
else
  puts 'No'
end