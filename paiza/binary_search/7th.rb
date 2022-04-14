require "stringio"

$stdin = StringIO.new("23 5 7
2 6 9 10 12 15 19")

# L cm n 人でわける、k 個の切れ目がもともとある
L, n, k = gets.chomp.split.map!{|n| n.to_i}

# i 番目の切れ目が左から a_i cm のとこにある

arr_break = gets.chomp.split.map!{|n| n.to_i}
arr_break << L
arr_break.unshift(0)

# 切れ目を n-1 個　選択、なるべく長く

ok = 0
ng = L

while ng - ok > 1
  mid = (ok + ng) / 2
  # puts "mid:#{mid}"
  # puts "ok:#{ok}"
  # puts "ng:#{ng}"
  n - 1
  tmp_len = 0
  cnt_divided = 0
  (arr_break.length-1).times do |i|
    tmp_len += arr_break[i+1] - arr_break[i]
    if tmp_len >= mid
      cnt_divided += 1
      tmp_len = 0
    end
  end
  # puts "cnt:#{cnt_divided}"
  if n <= cnt_divided
    ok = mid
  else
    ng = mid
  end
end

puts ok

# 最も短い太巻きが x 以上となるよう n　分割する
# ならば y <= x の y は最も短い太巻きが y 以上となるよう n 分轄できる。

