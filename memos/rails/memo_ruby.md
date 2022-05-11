+ gem インストール（rubyのみ）
  rails がなくても普通に gem install でインストールしたらいい。
  

  cf) hashed 
  type コマンドででてくる。これはフルパスが検索大変なので、hashテーブルで管理して簡単に実行できるようにしてるよっていう。

+ arr.new([n]) { rand(num)}
n の要素数のランダム（max <= num）の配列を生成できる。

+ 二次元配列 Array.new
[こちらを参照](https://simanman.hatenablog.com/entry/2013/06/24/200306)
Array.new(3) { Array.new(3, 0)} が正しい。
× Array.new(3, Array.new(0))
cf) 二次元配列をフォーマットして出力
a = [[1, 2], [3, 4]]
puts a.map{|e| e.join ' '}

出力:
1 2
3 4

map は新しい Array をつくるので a が大きい場合は
a.each{|e| puts e.join ' '}
