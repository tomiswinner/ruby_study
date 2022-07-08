+ scp -P [ポート番号] -F [configファイル] [対象ファイル] [hostname]@:[ディレクトリ]
[対象]がディレクトリなら -r オプション<br>



+ 存在しないパイプに書き込もうとしました。
仮想マシンを再起動したさいか、docker導入の影響か、port番号が変わっていた。<br>
だから、.ssh/config ファイル内のポート番号を vagrant ssh-config にて出てくる番号に変えた場合、うまくいった<br>


+ Host key verification failed.
  ipアドレスが変わった際に出るエラー。[詳細はこちら](https://qiita.com/hnw/items/0eeee62ce403b8d6a23c)<br>
  known_hosts に保存されているものの中で、鍵が違うと発生する。
cf) ssh 接続履歴
  接続したホストは$HOME/.ssh/known_hosts に保存されている。

+ config
~/.ssh/config  に設定を記載すると、ssh 時に勝手に使用してくれる。
~/.ssh/config はユーザーごとなので、sudo だと別のファイルが使用されるので注意。
