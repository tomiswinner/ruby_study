+ od
od -t x  16進数


+  man -f man
>> nothing appropriate となったとき
DBが作成できていない
	+ mandb -c
	+ makewahtis
などのコマンドでDBを作成する必要あり。
この場合、-v をつけたげると進捗がわかる。
※)makewhatis は RHEL7, CentOS7 では mandb コマンドらしい

+ fdisk -l
cat /proc/partitions 目的語ない場合、右記と同じ。

+ E325 Attention
.swap ファイルができている or　同時に編集してるとおこるっぽい
同時編集をやめたり、swapファイルを削除すれば解決する。

+ jobs と ps
job とは現在のターミナルで実行中のものだけを表示するらしい。

+ yes コマンド
yes [文字列] を出力し続ける。
yes test > /dev/null& などで出力を捨ててbg実行すれば、簡単にダミープロセスが作れる。

+ バックグラウンド処理は ctrl + c が聞かない。
バックグラウンドグループとフォアグラウンドグループの違いのためである。
大きな違いは、端末からの入力を受け付けるか否か。

+ rpm逆引き
rpm -ivh >>　詳細+DL状況表示しながら、インスト
rpm -qi [pkgname] >> 詳細情報表示
rpm -Uvh >>  既インストファイルをアップグレード
rpm -qa >> 既インストファイルを一覧表示
rpm -ql [pkgname] >> 特定pkgによってインストされたファイルを一覧表示
rpm -qc [pkgname] >> 特定pkgの設定ファイルのみ表示
rpm -qf [filename] >> 特定ファイルがどのpkgか表示
rpm -q --changelog [pkgname] >> パッケの更新履歴を表示
rpm -qR [pkgname] >> pkg の依存関係表示

+ yum 逆引き
yum check-update >> アップデート必要なpkgリスト一覧表示
yum clean all >> キャッシュなど削除
yum list updates >> パッケージのリストをアップデート
yum update [filename] >> アプデ
yum remove >> 削除
yum list all >> インストール済リスト表示
yum repolist >> 有効なリポジトリをリスト表示
yum info [pkgname] >> pkg 情報表示
yum seach [pkgname] >> pkg 検索
yum grouplist >> グループ(yumパッケージの集合)を一覧表示

+ スーパーブロック
ファイルシステムの論理パーティションを管理するメタデータのこと。
dump2efs コマンドにて確認できる。

+ ブロックアクセスとファイルアクセス
簡単に言うと、コンピューターが扱いやすいのがブロックアクセス
人間に扱いやすいのがファイルアクセス
ブロックアクセスのほうが高速。


