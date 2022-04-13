require "stringio"

$stdin = StringIO.new("5 3
2 1 3 5 4
2 2 4 3 5")


n_treasures, k = gets.chomp.split.map!{|n| n.to_i}

arr_weight = gets.chomp.split.map!{|n| n.to_i}

arr_treasure = gets.chomp.split.map!{|n| n.to_i}


ok = 0.to_f
ng = 5001.to_f

100.times do
  mid = (ng + ok) / 2
  arr_val = []
  arr_treasure.each_with_index do |elem, i|
    # treasure / weight >= mid を変換 >> treasure - mid * weight >= 0
    arr_val << elem.to_f - arr_weight[i].to_f * mid
  end
  arr_val.sort!.reverse!
  # print "#{arr_val}\n"
  # print "total:#{arr_val[0..k].sum}\n"
  # puts "#ok:#{ok}, ng:#{ng}"
  if arr_val[0..k-1].sum >= 0
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

# なんで平均値をソートして貪欲にとったらいけないのか >> これは % の計算だから。
# 分数は分母を揃えないと計算できません。

# なので実際に財宝を k 個とってきたと仮定し、
# とってきた平均の値を計算してソートすれば、最大の方から貪欲に考えてよい

# https://scrapbox.io/hkurokawa-cp/ABC_034_D_-_%E9%A3%9F%E5%A1%A9%E6%B0%B4
# 上記リンクが非常にわかりやすい

# やることは、条件（x%以上の平均値になる)をつけたうえで、条件以上の宝の価値をソートして貪欲する。

# w=水の量、p=パーセント
# 単純なパーセントでは測れないなぜなら、母数が大きいものほど、与える影響も多いから。
# じゃあ食塩の量の大きさでみたらいいやってなるけど、その場合、食塩の量の大きさでも、水の量によって違うのでマイナスがありうる。(=食塩の量によって、パーセントに与える影響はプラスにもマイナスにもなりうる)
# じゃあ、一定以上のパーセントの食塩の量だけを見る(=パーセントが変化しないものは0となり、線引きによって食塩の量を単純大きいか大きくないかで比較できるようになる、マイナスを排除してる)
# 14:05
# 単純に比較できないものは、
# 条件を加えて比較する