+ find -name [search_word] -type f | xargs mv -t [destionation] 
検索したものを全て指定のディレクトリに移せる。
ポイントは xargs と mv -t   mv は標準入力をもらえないので、
xargs を使用。移動先は -t で明示しないといけない。
-type f はファイルのみ検索

