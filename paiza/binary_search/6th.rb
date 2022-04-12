require "stringio"

$stdin = StringIO.new("5 3
2 1 3 5 4
2 2 4 3 5")


n_treasures, k = gets.chomp.split.map!{|n| n.to_i}

arr_treasure = gets.chomp.split.map!{|n| n.to_i}

arr_weight = gets.chomp.split.map!{|n| n.to_i}


ok = 0.to_f
ng = 5001.to_f

100.times do
  mid = (ng + ok) / 2
  arr_val = []
  arr_treasure.each_with_index do |elem, i|
    arr_val << elem.to_f - arr_weight[i].to_f * mid
  end
  arr_val.sort!.reverse!
  print "#{arr_val}\n"
  if arr_val[0..k].sum >= 0
    ok = mid
  else
    ng = mid
  end
end

puts ok

# k個以上の財宝の平均価値x
# 平均価値yについて、y <= x であれば、k個の財宝の平均価値をy以上になるように財宝を選ぶことができる
# 日本語難しすぎじゃ？　シンプルに k 個の財宝に平均価値が x なら、 x より小さい平均価値は全て k 個の財宝を選ぶことで達成できる

# k個の treasure と　weight の平均価値（Σtreasure / Σweight）　が >= x であればよい
# なぜ >= 0 の形にするかというと、割り算をすると数値が丸められる？（日本語正しいかは怪しいけど）から。
# 極力掛け算の形などにしていく。