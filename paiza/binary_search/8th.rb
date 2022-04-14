# n-1 <= k <= 20,000 なので、分割する長さは必ず切れ目以上となるか

require "stringio"

$stdin = StringIO.new("23 5 7
2 6 9 10 12 15 19")

L, n, k = gets.chomp.split.map!{|n| n.to_i}

arr_breaks = gets.chomp.split.map!{|n| n.to_i}

arr_breaks << L

arr_breaks.unshift(0)

ng = 0
ok =  L

while (ng - ok).abs > 1
  mid  =  (ng + ok) / 2
  tmp_len = 0
  cnt = 0
  (arr_breaks.length-1).times do |i|
    tmp_len += arr_breaks[i+1] - arr_breaks[i] 
    if tmp_len > mid
      # mid となった時、arr_break[i]で切れ目を入れる
      tmp_len = arr_breaks[i+1] - arr_breaks[i] 
      cnt += 1
    end
  end
  # puts "ok:#{ok}, ng:#{ng}, cnt:#{cnt}" 
  # cnt は切れ目の数なので、n-1 を対象とする
  if n-1 < cnt
    ng = mid
  else
    ok = mid
  end
end

puts ok 

# 最小とする場合、n 分割するとき、最大の長さ幅を持つ場所にいれていけばい
# x の長さで分割していく、それで分割していったときに、個数が n 以下になれば ok
# x の長さで分割できるならば、x <= y となる y はすべて、個数が n 以下の個数でしか分割できない。
# なので、n 以下の個数で分割できる最大の x を見つければ、それが答え  

# 切れ目一つ > mid だった場合
# mid <= tmp_len となった時、arr_break[i-1]
# どうにしろおかしくなるので、切れ目よりも mid は大きいことを担保してあげないと厳しい
# n-1 <= k の制約でそもそも考える必要なかった。
      
# 切れ目一つ < mid なら
# 切れ目一つより必ず大きいことを担保すると、mid <= tmp_len となった時、
# arr_break[i] でカット
# tmp_len = arr_break[i+1] - arr_break[i] 
 
