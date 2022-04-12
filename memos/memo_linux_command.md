+ find -name [search_word] -type f | xargs mv -t [destionation] 
検索したものを全て指定のディレクトリに移せる。
ポイントは xargs と mv -t   mv は標準入力をもらえないので、
xargs を使用。移動先は -t で明示しないといけない。
-type f はファイルのみ検索

+ ヒアストリング
bash で、とあるコマンドの標準入力に文字列を渡すとき、

$ echo "hoge" | toarucmd
こんな感じにすることがあります。これはヒアストリングを使うと、

$ toarucmd <<< "hoge"
と書けます。

これを踏まえて、

$ echo "mae ushiro" | read mae ushiro
$ echo $ushiro $mae
とすると、"ushiro mae"と表示されま、、、、、せん。

変数 mae と変数 ushiro はパイプラインの中で用意されたため、パイプが終わった段階でなくなるためです。

本来やりたかったことをヒアストリングで実現できます。

$ read mae ushiro <<< "mae ushiro"
$ echo $ushiro $mae
ヒアストリングの使いどころの一例です。