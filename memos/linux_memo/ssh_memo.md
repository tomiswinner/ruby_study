+ Remote SSH vscode が接続できないとき
コマンドパレット(ctrl+shift+p)を起動して、 remote-ssh kill vscode server をして、再起動した直った。<br>
[こちらの_stackoverflowを参照した](https://stackoverflow.com/questions/67374506/visual-studio-code-remote-ssh-no-longer-working-waiting-for-server-log)<br>



+ ssh の暗号化
1. Symmetric Key (秘密鍵)
通信の暗号化に使われる。(http"s"的な)
2. Asymmetric Key (公開鍵)
Symmetric Key Communication の確立に使われる。つまり、秘密鍵の交換の際に使われる。<br>
public key(公開鍵) と private key(秘密鍵)を使って暗号化<br>
[CLIENT] 秘密鍵で暗号化 -> [SERVER] CLIENT公開鍵で復号化<br>
<?> 公開鍵の保証はどうするのか？？ -> vagrant で仮想環境作成時に多分勝手に置かれているんだわ<br>
[こちらを参照](https://www.hostinger.com/tutorials/ssh-tutorial-how-does-ssh-work#How_Does_SSH_Work)<br>


+ scp -P [ポート番号] -F [configファイル] [対象ファイル] [hostname]@:[ディレクトリ]
[対象]がディレクトリなら -r オプション<br>
- scp の仕組みは?
SSH ベース、ssh 接続を確立している必要があるらしい、、あれ？<br>



+ 存在しないパイプに書き込もうとしました。
仮想マシンを再起動したさいか、docker導入の影響か、port番号が変わっていた。<br>
だから、.ssh/config ファイル内のポート番号を vagrant ssh-config にて出てくる番号に変えた場合、うまくいった<br>
  - 再発生した。
  known_hosts ファイルが生成されてて、それを削除したらうまくいった。
  - known_hosts とは
  一度接続したサーバの ssh証明書が格納されるファイル<br>


+ Host key verification failed.
  ipアドレスが変わった際に出るエラー。[詳細はこちら](https://qiita.com/hnw/items/0eeee62ce403b8d6a23c)<br>
  known_hosts に保存されているものの中で、鍵が違うと発生する。
cf) ssh 接続履歴
  接続したホストは$HOME/.ssh/known_hosts に保存されている。

+ config
~/.ssh/config  に設定を記載すると、ssh 時に勝手に使用してくれる。
~/.ssh/config はユーザーごとなので、sudo だと別のファイルが使用されるので注意。