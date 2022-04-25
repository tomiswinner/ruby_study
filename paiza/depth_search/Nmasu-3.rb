require "byebug"
require "stringio"
$stdin = StringIO.new("10 7 10
6 1")
h, w, n = gets.chomp.split.map!{|n| n.to_i}

y, x = gets.chomp.split.map!{|n| n.to_i}

mp = Array.new(h) { Array.new(w, '.')}

len = Array.new(h) { Array.new(w, -1)}

Q = []
Q.unshift([y,x])
len[y][x] = 0
mp[y][x] = '*'


while !(Q.empty?)
  now = Q.pop()
  ny = now.first
  nx = now.last
  # puts "ny, nx: #{ny}, #{nx}"

  if len[ny][nx] == n
    next
  end

  for i in [1, -1] do
    if 0 <= ny + i && ny + i < h && mp[ny + i][nx] == '.'
      Q.unshift([ny + i, nx])
      len[ny + i][nx] = len[ny][nx] + 1
      mp[ny + i][nx] = '*'
    end

    if 0 <= nx + i && nx + i < w && mp[ny][nx + i] == '.'
      Q.unshift([ny, nx + i])
      len[ny][nx + i] = len[ny][nx] + 1
      mp[ny][nx + i] = '*'
    end
  end

# mp.each {|e| puts e.join ''}
end

# len.each {|e| puts e.join ''}
mp.each {|e| puts e.join ''}