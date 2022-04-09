n, k = gets.chomp.split.map!{|n| n.to_i}

arr_pipe_len = gets.chomp.split.map!{|n| n.to_i}

arr_pipe_len.sort!

left,right

mid = (left + right) / 2
while 
  mid = (left + right) / 2
  for

# 長さxノパイプをk本切り出せるなら y<= x のすべての yについて長さyのパイプをk本切り出せる
n_pipes = 0
arr_pipe_len.each do |elem|
  n_pipes += elem / mid   # パイプを長さで割り算、何個手に入るか計算
end