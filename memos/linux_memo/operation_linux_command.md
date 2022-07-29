#### **/var/log/messages がない場合**
+ ubuntu は /var/log/messages を使ってないらしい。/var/log/syslog を使っているとか<br>




#### ls | find -type f -not -name [検索語句] | xargs mv -t [移す場所]
指定したファイル以外を移す慣用句。<br>
" find -not " は指定した条件を打ち消せる。複数オプションを指定した場合 and になる<br>
" mv -t [場所]" は移動先を明示する。<br>

#### find -name [search_word] -type f | xargs mv -t [destionation] 
検索したものを全て指定のディレクトリに移せる。
ポイントは xargs と mv -t   mv は標準入力をもらえないので、
xargs を使用。移動先は -t で明示しないといけない。
-type f はファイルのみ検索

#### ヒアストリング
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

#### scp [コピー対象ファイル] [sshユーザー名]@[ssh ipアドレス]:/[パス]
  ローカルPC の　.ssh/config ファイルに設定が書いてある。
  Host が設定されていれば、それを目的語にして scp, ssh ができる。
  以下の環境変数を確認すればわかる
  + HOSTNAME
  ユーザー名が格納
  + SSH_CLIENT
  SSH_CLIENT shows the address of the client system, the outgoing port number on the client system, and the incoming port on the server

  + SSH_CONNECTION
  . Identifies the client and server ends of the connection. The variable contains four space-separated values: client ip-address, client port number, server ip-address and server port number.
 
  + grep -rn "文字列"
　文字列を -r ディレクトリを再帰的に、-n ファイル内の一致した行を返す。

  + grep "文字列" -rl [フォルダ]
  検索したい文字列を再帰的にフォルダを探す<br>

#### cat /etc/[OS名など]-release
  現在使用している linux distribution が確認できる。

## VIM
#### :sh
  シェルに入れる。exit で出れる。
  [こちら](https://www.tweeeety.blog/entry/2016/11/10/001855)
#### :%y
ファイル全体をコピーする。


