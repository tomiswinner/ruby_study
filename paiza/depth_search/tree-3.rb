require "stringio"
$stdin = StringIO.new("5 1
1 2
2 3
3 4
4 5")

n, x = gets.chomp.split.map!{|n| n.to_i}

graph = Array.new(n) {[]}

(n-1).times do 
  a, b = gets.chomp.split.map!{|n| n.to_i}
  graph[a-1] << b - 1
  graph[b-1] << a - 1
end

q = []

q << x-1
# n 個の頂点の距離を保存
len = Array.new(n, -1)
len[x-1] = 0

ans = []

while !q.empty?
  #now は　頂点番号-1 の インデックス
  now = q.pop()
  if len[now] == 3
    ans << now
    next
  end
  graph[now].each do |edge|
    if len[edge] == -1
      len[edge] = len[now] + 1 
      q.unshift(edge)
    end
  end
end

ans.sort!.each do |e|
  puts e + 1
end


