# require "stringio"

# $stdin = StringIO.new("5 12
# 5 9 7 6 7")

n, k = gets.chomp.split.map!{|n| n.to_i}

arr_pipe_len = gets.chomp.split.map!{|n| n.to_i}

left = 0.to_f
right = 10001.to_f

100.times do # 相対誤差が10^6以下ならok
  n_pipes = 0
  mid = (left + right) / 2
  arr_pipe_len.each do |elem|
    n_pipes += (elem / mid).floor
  end

  if n_pipes < k
    # kの個数より少ないので、もっと長さを短くする
    right = mid
  else
    left = mid
  end
end

puts left



# float = c言語の double 精度は環境依存だが、一般には15けた



