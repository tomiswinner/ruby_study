
## VIM
+ word と WORD
word >> vim の config の iskeyword に設定された文字列から構成されるもの。
WORD >> 空白で区切られた塊すべて　WORDs are separated by whitespace



+ 「<<<」 指定した文字列を**標準入力**に出すことができる。
これにより echo などで変数を渡す必要がなくなる？
正直 echo でいいんじゃないかとは思う<br>
cat などは、直接文字列を引数としてとれない？
  + echo >> 指定された引数を**標準出力**に出力するコマンド
  + 「<」　ファイルなどを標準入力に送る。

ジョブ
コマンドやプラグラムの上位グループ
コマンドをパイプで結んだら、ジョブ
cf)フォアグラウンド fg   バックグラウンド bg

・optディレクトリ
追加インストールしたパッケージを格納するので容量が大きくなりがち
cf)ルートパーティションとスワップ領域
ルートパーティション>>ルートファイルシステム用の領域
ルートファイルシステム>>ファイルシステムの最上位、ここに全てが保管されるのではなく、複数のパーティションを用意して各ディレクトリを割り当てる
ルートファイルシステムには、システムの起動に必要な /bin, /sbin, /lib, /dev ,/etc など割り当てられる
・xargs
xargs の標準入力に文字列を渡すと、
その文字列を引数として xargs の引数となるコマンドを実行してくれる。
ex)
cat file.txt | xargs touch
で　file.txt の中のファイルを全て作成できる
・BIOS basic input output system
pc の一番最初に起動するもの。
①HDDなど最低限の認識を行い
②ブートローダを起動
③起動するデバイスの優先順位を決める
cf) ブートローダ
OSなどから読み出し、最初に起動される子

・環境変数PATH
シェルはパスを指定せずに入力されたコマンドに対して、環境変数に設定されたディレクトリの中から検索して実行してくれる。
デフォルトでは /usr/sbin, /usr/bin に設定されてる。

・touch -t [yyyymmddhhmm.ss] [filename]
アクセス時刻と修正時刻を変更できる。
アクセス時刻だけなら　-a となる

・MD5 message digest 5
ハッシュ関数の一種。
md5sum でデータが改竄されてないからチェックできる(暗号系をチェックするのは全てsum)


+ ls -F
ディレクトリやプログラムを明示してくれる。
alias ='ls -F' などでエイリアスにすれば常にやってくれる。


GRUB GRand Unified Boot loader
HDDからOSを起動するブートローダの一部。
The GRUB (Grand Unified Bootloader) is a bootloader available from the GNU project. A bootloader is very important as it is impossible to start an operating system without it. It is the first program which starts when the program is switched on. The bootloader transfers the control to the operating system kernel.

GRUB is the default bootloader for many of the Linux distributions.
https://www.tutorialspoint.com/what-is-grub-in-linux
cf) grub-mkconfig
設定ファイルを grub に反映させるコマンド
・grep -f [file]
ファイルから検索パターンを読み込むオプション
・ACPI Advanced Configuration and Power Interface
OS側から電源を切るように指示をできるようにしたインターフェース。本来、APMなるハードで電源管理していた。
シャットダウンや再起動はACPIイベントと認識される。
acpid がACPIイベントを監視するデーモンである。

・sed  置換を行える
sed s/文字列a/文字列b/   a を bに置換
sed  行番号,行番号d  間の行を削除

・SGID Set Group ID
誰が操作しても、セットしたグループの権限で実行する
chmod 2○○○ とする(本来の権限の前に2を付与する)か、 chmod g+s [file] でできる。
cf)SUID Set User ID
ユーザー版
・chmod  change mode
アクセス権の変更
・chown change owner
所有ユーザー、グループの変更
chown :[group]    =   chgrp [group]
・chgrp
所有グループの変更
・ln [ link source ] [ new name ]
-s オプションをつけて、シンボリックリンクにするのが一般的
cf)>inode     ( index node )
ファイルの管理用の番号
>ハードリンク
「.」「..」もハードリンク
>シンボリックリンク
デスクトップなんかのショートカットはこれ。目的のファイルへのパスである。
・uniq -d [ file ]
ファイルの重複した行のみを表示する。

・nice 値　
ユーザーが作業する際の優先度を決める値。
ユーザー用の空間の中での優先度。
cpu はコア数 n のプロセスしか実行できない。( n 以上のプロセスは高速で切り替えしながら対応)
cf) priority 値
linux kernel が実際に利用する値
The priority value is the process’s actual priority which is used by the Linux kernel to schedule a task.
In Linux system priorities are 0 to 139 in which 0 to 99 for real-time and 100 to 139 for users.

https://medium.com/@chetaniam/a-brief-guide-to-priority-and-nice-values-in-the-linux-ecosystem-fb39e49815e0

>>renice
実行中のコマンドの nice 値を変更する
renice [-n] nice値 オプション

・シェル変数
echo $CONSTANT   で確認できる
設定するなら、CONSTANT = val

・共有ライブラリ
cf) LD_LIBRARY_PATH
LD = Linker  or   Loader   
linker  >>  executable file を生成するもの。
loder  >>  executable file をメモリへロードするもの。

https://www.tutorialspoint.com/difference-between-linker-and-loader

・grub-install
GRUB をインストールするコマンド
・gzip
Lempel-ziv なるアルゴリズムを用いてファイルを圧縮する。linux でよく使われる圧縮方式、[    ].gz ファイルとなる
gzip -d [  ] = gunzip  = ファイルを展開

・特殊記号
＊ >> 0文字以上の文字列、ワイルドカード
. >> カレントディレクトリなので任意の1文字にならない！>> ? が対応
'  >> 囲むとメタ文字も普通の文字列としてくれる
$ >> 変数
¥ >> 次1文字をエスケープ
｀>> 囲むと変数やコマンドとしてみなし、実行結果を文字列で返す

tutorialspoint.comtutorialspoint.com
What is GRUB in Linux?
What is GRUB in Linux? - The GRUB (Grand Unified Bootloader) is a bootloader available from the GNU project. A bootloader is very important as it is impossible ...

MediumMedium
A brief guide to priority and nice values in the linux ecosystem
Using nice values to control the priority of your processes.
Reading time
4 min read
2019年4月17日 (259 kB)
https://medium.com/@chetaniam/a-brief-guide-to-priority-and-nice-values-in-the-linux-ecosystem-fb39e49815e0


tutorialspoint.comtutorialspoint.com
Difference Between Linker and Loader
Difference Between Linker and Loader - In this post, we will understand the difference between a linker and a loader −LinkerThe main function of the linker is ...







## コマンド
+ lf -F
タイプ識別子をつけて表示してくっれる。
alis ls = 'ls -F' とすれば ls がデフォルトで -F となる。


let コマンド
算術式を評価してくれるコマンド

- Ctrl-a:  move cursor to the beginning of the line
- Ctrl-e:  move cursor to the end of the line
- Meta-b:  (or Alt-b), move backward one word
- Meta-f:  (or Alt-f), move forward one word
- Ctrl-u:  Cut from cursor to beginning of line
- Ctrl-k:  Cut from cursor to end of line
- Ctrl-w:  Cut previous word
- Ctrl-y:  Paste what you just cut with Ctrl-u, Ctrl-k, or
           Ctrl-w


+ sed s コマンド
正規表現で置換してくれる。
"s/,,/,/"  であれば、「,,」を「,」にしてくれる。

+ pushd と popd と dirs
pushd [directroy] で dirs に追加、 popd で解放のスタック
pushd するとそのディレクトリへ移動できる。その時、元いたディレクトリが dirs に追加される。
この状態で、popd をすると、元居た場所へ戻れるという寸法。





