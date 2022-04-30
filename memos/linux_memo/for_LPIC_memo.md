
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





Gmail	T Oshima <mouseofsack911@gmail.com>
(件名なし)
T Oshima <mouseofsack911@gmail.com>	2022年4月10日 18:56
To: takuto_oshima@aeon.co.jp
lpic

・ddコマンド

cpコマンドと違い、ファイルシステムがないデバイスへも、コピーができる。

(ブロック単体でのコピーらしい)

ddコマンドはOS関係なしにもっと深い階層でコピーを行える(ストレージのここからここまでを強制的に上書きするなど)

if= [入力ファイル]

of=[ 出力ファイル]

bs >> block size 一度に読み書きするバイト数

ex)  dd if=/dev/zero of=testfile bs=1M count=5







・killall, pkill コマンド

kiall -s [シグナル] [process] 

process に対してシグナルを送る。

kill と killall の違いは、killall は指定したコマンドを実行中のプロセス全てにシグナルを送る。

kill はデフォルトで 15番シグナルを送るってなってるってことかな？

cf)シグナル

シグナルを送ってプロセスを管理するらしい

15番　SIGTERM は終了



・/sbin 

システム管理者用のコマンドが格納されてるディレクトリ



・tail オプション3つ

-n 末尾からn行表示(-n 省略可能)

-c 指定したバイト数表示

-f  最新の内容を反映し続ける



・parted コマンド

parted -l   パーティション一覧表示

引数なしで、parted 対話モード

>>mklabel msdos

パーティションの方式を指定

>>mkpart 

パーティション作成

>> print

パーティション情報を表示

>> quit 終了



cf)MBR と GPT 

Master Boot Record

最大2TBのパーティション方式

GUID Partition Table

最大8.5ZB のパーティション方式

最新はGPTなので基本GPT?



・fsck コマンド(file system check??)

ファイルシステムが問題ないかチェックし修復する(対象はデバイス)

>>e2fsck.も同じようなもの。、



・du コマンド

ディレクトリ内のファイル容量を表示するコマンド

cf)df コマンド

ファイルシステム全体の容量表示



・nice値の幅

-20から19までで、値が小さいほど優先度高い



・tar コマンド

ファイルを一つにまとめるコマンド(アーカイブと呼ぶ)

オプションいっぱいある。

z >> gzip で圧縮する

f >> アーカイブ後のファイル名を指定

x >> アーカイブを展開

v >> 処理の詳細を表示





・export コマンド

シェル変数を環境変数へと変更する

cf)シェル変数と環境変数

シェル変数は現在のターミナル(シェル)のみ

環境変数はシェル再起動しても保存



・IRQ  Interrupt ReQuest

割り込み要求

/proc/interrupts 以下に情報が配置される。

0から番号が振られ、優先度がある。





・sort コマンド

行単位でファイルの中身をsortしてくれる

-b 行頭空白無視

-r reverse

-f 大文字小文字無視



・LVM Logical Volume Management

論理ボリュームのこと。

ボリュームの変更前をスナップショットできる



・シグナル

一時停止系 >> STOP, TSTP   再開 CONT





・ランレベル

linux の動作モードのこと。

systemd.unit = 〇〇　にてカーネルパラメータを指定する

0-6の7種類

0 >> シャットダウン

1 >> シングルユーザー

4 >> 未使用

6 >> 再起動



・改行コード

windows >> \r\n

uxix >> \n

なので\r を削除すると linux で使えるファイルになる。



・umount コマンド

デバイス(ファイルシステム)のマウントを解除する。



・rpm  Redhat系のパッケージ管理ツール

-l  (--list)パッケージに入ってる中身を一覧

-q (--query) 指定したパッケージを検索

-i (--info) パッケージの詳細情報表示

-f (--file) パッケージのインストールもとを表示







・file コマンド

ファイルの形式を表示してくれるコマンド



・カレントディレクトリ以下にある14日以上アクセスの無いファイルを削除する場合
$ find . -atime +13 -type f -exec rm {} \;

｛｝は検索結果のファイルが代入される。

；はコマンド終了(シェルで、メタ文字のため、エスケープ)

find -type l

シンボリックリンクを探す。

(ハードリンクは普通にファイルででてくるのか？)





・swap領域

RAMが2GB未満の場合：RAMの2倍
RAMが2GB～8GBの場合：RAMと同量
RAMが8GB～64GBの場合：4GBからRAMの0.5倍
RAMが64GB以上：負荷に依存するが、少なくとも4GB

・Upstart

bios>>ブートローダ>>kernel>>初期プロセス

この、初期プロセスが systemd, Upstart, SysVinit である。

現代の主流は systemd なのでほか2つはいらんかも？

linuxの起動の流れ

https://tech.pjin.jp/blog/2020/11/11/linux-system-boot-2#content-1

cf)systemd

各プロセスを並列起動。

処理を「unit」単位で管理する。



・agt-get, apt

apt-get はもうレガシーでよさそう。aptが最新。Debian系(Ubuntuなど)





・tr コマンド

置換ができる。sed の下位互換、いらない子。



・xzcat 

xzファイルを展開して、標準出力する。

= unxz -c = xz -dc である。

各種圧縮には cat がついたコマンドがあるようだ。で、 d は deploy かな？ c は cat のオプションがある。



・ファイルディスクリプタ

0,1,2 がシェルでの予約語

0 は標準入力の変数、デフォルトはキーボード

1 は標準出力の変数、デフォルトはスクリーン

2 は表示エラー出力の変数、デフォルトはスクリーン

ファイルディスクリプタを指定するには、

&2 のように頭に& をつければよい。

ex) 標準エラー出力を標準出力にリダイレクト

2>&1

ex) 「sh test.sh」コマンドを実行した時に出力される標準出力と標準エラー出力の両方を「out.log」ファイルに保存

sh test.sh > out.log 2>&1





・dpkg Debian PacKaGe コマンド

Debian のパッケージを管理する

apt はこれに加え、依存関係もやりくりしてくれる上位コマンドみたいなもの

-i(--install)  インストール

-E 既にインストール済みならインストールしない

-r (--remove) アンインストール(設定ファイルは残る).

-s(--status) インストール済みパッケージの詳細表示

-S(--search)指定したパッケージがどのパッケージからか検索

-P 設定ファイルも含め完全アンインストール



・split コマンド

ファイルを指定した行数で分割(デフォルトは1000)



・fg コマンド

引数なしだと、カレントジョブ(直前にbg実行したジョブ、一時停止したジョブ)が対象となる。



・デバイスクラス

各種デバイスは取り扱いのためにクラスが用意されている。

ACM Communiation Devise Class

モデム、TA>> アナログデータをデジタルデータに変換するもの



・mount コマンド

mount [ device ] [マウントポイント]

-t オプション　ファイルシステムの種類を設定

引数なしで、マウント状況表示

(基本的に勝手に認識してくれ、/dev配下に突っ込んでくれる、mountを使えば自分の好きな場所にmountできる)

cf) マウントポイント

linux ではデバイスを認識するためにはファイルシステムの一部に追加する必要がある。

この操作をマウントと呼ぶ。デバイスをマウントしたディレクトリをマウントポイントと呼ぶ、一般的に/mnt,/media にマウントポイントを作る





・^M 

CR キャリッジリターンを表す

 本来、/r だが、^Mでも表される。



・od コマンド　Octal Dump の略(なのでデフォは8進数dump)

バイナリファイルを８進数、１６進数でダンプする。(バイナリファイルは2進数で大量出力されて見づらいから)



cf)ダンプ=出力



・apt のソース

/etc/apt/soucres.list にある

dpkg は　/etc/dpkg/dpkg.cfg



・RAM

initramfs =初期RAMのデータ

ブートローダにて、カーネルとともにメモリ上に展開される。

linux システムと途中で起動される小さなファイルシステム

 linux のながれ

電源投入
BIOS/UEFIの起動
ブートローダ（GRUB,GRUB2..）
カーネル（vmlinuz）とinitramfs（初期RAMディスク）の読み込み
カーネルの実行
initramfs（初期RAMディスク）の実行
initの実行（SysVinit,Systemd..）


初期RAMディスクとは、Linuxシステムの起動の途中で一時的に利用される小さなルートファイルシステムのことです。

初期RAMディスクには、/bin /lib /dev などのディレクトリがあり、それぞれのディレクトリには必要最低限のコマンドやデバイスファイルなどが含まれています。 つまり、初期RAMディスクは、小さなLinuxシステムであるともいえます。
https://my1cdlinux.eksd.jp/createbootablelivecd_aboutinitrd.html 



>>なぜこのような体制をとっているのか？

linux ではカーネルは必要な機能があれば、その機能をメモリにロードして使う

(カーネル本体を小さく保てる)

ただ、最初にルートファイルシステム構築に必要なプログラムの記述量は半端ない

(ルートファイルシステムを構築するための物理的なHDDなどの種類は無限にあり、それらに応じてコードを書く必要があるので)

※ドライバをモジュール化してロードするようにした

>>ここで問題、ドライバがないからカーネルではデバイスをマウントできない

>>初期RAMディスクに、ルートファイルシステムを構築してもらえばoK!!!



https://www.konosumi.net/entry/2020/09/27/223948





・uname

現在使用しているOSの情報を表示する

引数なしでOSの名前のみ、-a オプションで詳細表示



・apt-cache

パッケージの詳細情報の検索

search キーワード で検索

show パッケージ で詳細情報

depends パッケージ で依存情報

showpkg パッケージ でshow + depends



・i a I A

vi では i a は対となる。(a = append)

i はカーソル左から、aはカーソル右から

I は行左、A は行右





・grub プロンプト

grub> linux カーネルイメージ [オプション]

にて、プロンプト起動できる。

カーネルにオプションを指定が可能で、

>root= デバイス名　- ルートパーティションを設定

>init= コマンド　- init の代わりに指定したコマンドを実行

/dev/sda

最初に見つかったHDDはこの命名となる

2番目は/dev/sdb



・fdisk コマンド

パーティションの作成・管理に使うコマンド

fdisk デバイス名

で対話モードを起動し、操作する。

(対話中)

>n で新しいパーティション作成

>d で削除

>p でパーティション表示



作成したパーティションにファイルシステムを作るには、

>mkfs

>mke2fs

が使える。



・shutdown コマンド

時間を指定してシャットダウンなどができる

>shutdown 時間

時間

> HH:MM

> now

> +M



オプション

> -h 停止

> -r 再起動

> -c 実行中のshutdownをキャンセル





・man [ オプション ] [ セクション ] コマンド

man ページにはセクションが用意されていることがあり、その場合、man 6 などようにセクションを指定する必要あり。

オプション

-k キーワード部分一致のmanページ表示

-f キーワード完全一致の man ページ表示



・エントリ

Iノード番号とファイルを対応させた一覧表



・systemd 

Unit >> systemd の設定ファイル、これを読み込んでsystemd が動作する

拡張子に.mount や .service などがあり、それにより何をするUnitか把握できる。



全てをUnit で表現するので、ランレベルが存在しない。

targetにてグルーピングすることで、ランレベルを実装している。

最初のUnit >> /etc/systemd/system/default.target



cf)target

Unit をグルーピングしたもの、役割ごとのUnitをまとられる。

>>poweoff.target  ランレベル0 = 停止

>>rescue.target 1 = シングルユーザー

>>multi-user.target 2 = マルチユーザー(コンソール)

>> graphical.target 5 = マルチユーザー(GUI)

>> reboot.target 6 = 再起動

cf)シングル ユーザ モード

Windows OSのセーフモードに該当するLinux OSの起動方法です。 主に、メンテナンス時に利用されます。 シングル ユーザ モードで起動することにより、ネットワークやデーモンを起動させず、またroot 以外のログインを許可しません



・bzip -d = bunzip2

bz2ファイルの展開に使う



・whatis = man -f

apropos = man -k





・ファイルシステムの種類

ext2 >>初期のlinux 非推奨

ext3 >> ジャーナル対応

ext4 >> デファクトスタンダード

xfs >> RHELのデフォルト、スケーラビリティが高い

mkxfs.xft - xfs ファイルシステムを作成

xfs.db - xfs のデバッグをする

xfs.info - xfsの情報表示





・/boot/grub/grub.cfg

GRUB2 でのパーティションの設定

set root=(hd0,1)

のように設定する。

ディスク番号は0、パーティション番号は1からである。



・/etc/fstab

linux において、マウントする側でマウント情報を書くファイル。

マウントされる側は/etc/exports に設定を書く。

noauto  > mount -a で自動マウントしない <=> auto

ro> read only <=> rw

noexec > 実行禁止　<=> exec

nouser > 一般ユーザーmount NG







・シンボリックリンク

パーミッションを変更した場合、シンボリックリンク自体のパーミッションは変わらず、元ファイルが変更される





・apt-get

apt-get upgrade > インストール済みをアップグレード

apt-get update > パッケージDBをアップグレード



・tee コマンド

標準入力を標準出力、ファイル双方に出す。

オプション

-a ファイルに上書きでなく、追記する



・/dev

デバイス関連である



・/usr/bin>>システム起動に不要な一般ユーザー用コマンド

/usr/sbin >>システム起動に不要な

/usr/local >>ホスト固有でやる使用するコマンドなど

/usr/share/man マニュアル



・mount 

-t ファイルシステムの種類指定

-o マウントオプション指定



・sysctl    default.targetの管理

disable > 自動起動無効化　<> enable

set-default > 次回起動時のtarget指定

reboot > システム再起動

reload > 設定ファイル読み直し

restart > サービス再起動



・udev

ホットプラグ(繋いだら自動的にマウント)に対応した仕組み

デバイスを検知すると自動でデバイスファイルを自動で作成する。

etc/udev/rules.d」ディレクトリに配置された設定ファイル（拡張子「.rules」）に記述された情報に基づいて行われます。





・/proc/cmdline

ブートローダからカーネルへ渡された引数を確認することができる。

root=/dev/sda2  など



・MBR Master Boot Record

GRUBなどのブートローダはHDDの最初のセクタ(512B)をMBRにあてている。

ブートローダ部分はうち先頭446B

DPT(disk partition table) 64B

ブートサイン(2B)

GPT形式でも同様MBRセクタは存在



MBRとは、ハードディスクなどのストレージ（外部記憶装置）の最も先頭にある、起動に必要なプログラムや情報を記録した小さな領域。コンピュータの起動時に最初に読み込まれる。





・ls -a と -A

基本は同じ。Aは. と　.. は表示しない。



・dnf

yum の後継　dandified yum



・wc コマンド(word count)

-c バイト数表示

-m  ファイルの文字数表示

-w 単語数表示



・代表的な環境変数

HISTFILE コマンド履歴が保存されてるとこのパス

HISTSIZE 現在シェルのコマンド履歴数

HISTFILESIZE ファイルへの履歴保存数

HOME ログイン中ユーザーのホームディレクトリ

HOSTNAME

LANG 言語設定

PATH コマンド、プログラムを探場所のパスリスト

USER ログイン中ユーザー



・nl コマンド

行番号つきでファイルを表示する



・/var

ログファイルやメールなど可変なものが格納される。(書き込みが大量に起きる)





・set, env コマンド

set はシェル変数+環境変数

env は環境変数を一覧表示

cf) printenv 全てor一部環境変数表示







・UEFI (BIOS の高機能版)

BIOS/UEFIセットアップ画面では、主に以下の設定ができます。
・日付と時刻
・電源管理
・起動デバイスの優先順位
・組み込みデバイスの有効/無効化

cf)UEFI

GUI操作可能

マウントはは/boot/efi、GPT形式HDDをサポート



・D-bus (desktop-bus)

プログラム同士が情報をやり取りするための、プロセス間通信機器







・swapon <=> swapoff

スワップ領域として指定しているデバイスかスワップファイルとするファイルを指定すると、onになる。

cf)mkswap > スワップ領域を作成する

fdisk > スワップ用のパーティションを作成

流れ

fdisk /dev/sdb

mkswap /dev/sdb1

swapon /dev/sdb1





・fgrep = grep -F

正規表現ではなく、文字列そのままを検索するgrep

cf)egrep = grep -e

拡張正規表現を使えるコマンド

cf2)grep -v

マッチしない行を表示する

grep -i

大文字小文字区別なし



・atime, mtime, ctime

atime > accessed time

mtime > modified time

ctime > created time





・gzip -c

元ファイルは残した状態でgz化する

-r > ディレクトリ含め再帰的圧縮





・wall (write all) [ file ]

Linuxはマルチユーザー、マルチタスクなOSであるため、複数人で同時に使用することができます。そのため、システム停止作業は多数のユーザーに影響することになってしまいます。
そういった案内を通知するために、ログイン中の全ユーザーにメッセージを送信する「wall（Write ALL）」コマンドがあります。



・/lib 

共有するライブラリを格納、ルートパーティション



・cut コマンド

-c 抽出する文字位置指定

-d 区切り文字指定(デフォルトはtab)

-f 抽出するフィールドを指定

-f n  > n 番目, -f n,m > nとm番目



・inodeの状況を確認する

df -i で確認できる。

動的inode機能がない場合、inodeの上限はファイルシステム作成時に決まる。(ファイルシステムごとにinodeは管理される)だからinode状況には注意が必要。、



・paste コマンド

paste」は、複数のファイルを行単位で連結するコマンドです。「paste ファイル1 ファイル2」で「ファイル1の1行目とファイル2の1行目」、「ファイル1の2行目とファイル2の2行目」……という行が出力されます。Excelに親しんでいる方は、「列のコピー」と考えると動作をイメージしやすいかもしれません。





・watch コマンド

watch -n 10 ps

一定時間間隔でコマンドを実行してくれる



・sed y

sed y/ab/AB/ test.txt

a A  b Bに変換できるん(yは1文字ずつ変換)



sed -e s/a/A/g -e s/b/B/g

e は編集コマンドを指定(一つなら省略ok)



・tunefs コマンド

-c マウント回数がn回で検査する

-i     n時間での検査を指定

-j   ext2をext3へ

-L ボリュームラベルを変更

cf)ボリュームラベル

ファイルシステムの名前、人間に使いやすいものをつけれる。



・yum grouplist

グループ>パッケージ

grouplistでグループごと見れる



・/dev/sda5

論理パーティションは必ずsda5から始まる



・Btrfs

次世代linux

マルチデバイス・サブボリューム・ファイルシステム自動圧縮



・ls -i 

inode番号も表示





・xz > bzip >gzip



・find 

-mindepth,maxdepth

指定した階層から、まで、





・telinit [ runlevel ]( init [ runlevel ])

ランレベルを切り替える



・sed /^#/d test.txt

先頭#の行を削除する



・systemctl

disable 無効化　<=> enable

get-default 次回起動時のターゲット表示

set-default ターゲット設定



・メタキャラクタ　\

次に続くメタキャラクタをエスケープするメタキャラクタ

\work ディレクトリを作る場合、

\\work  とする必要がある。



・tail -n 5

5行表示



・vi -R 

読み取り専用で開く



・nice testfile = nice -n 10 testfile

ナイス直を指定してファイルを実行する。

デフォは10、niceコマンドを使わずに普通に実行した場合は0

ややこしいふざけ〜



・uptime

コマンド実行時刻、システム稼働時間(up)、ログインユーザー数(user)、CPUの負荷平均値値(load average)最後の1分、5分、15分を表示(負荷100%を1とする)

topコマンドも似ており、プロセスの稼働状況を表示できる



・uniqコマンド

重複行を削除する。

-c 重複回数を表示(--count)

-u 重複しない行表示(--unique)

-d 重複行だけ表示(--repeated)



・pgrep コマンド

プロセスを検索できる

pgrep -U 0

pgrep -u root



・パーティションタイプ

https://pctrouble.net/storage/partition_difference.html



・/etc/ld.so.cache

共有ライブラリの場所を検索するために使用されるバイナリファイル

/etc/ld.so.conf には共有ライブラリのパスが記述されており、

ldconfig は/etc/ld.so.conf を参照して/etc/ld.so.cache を作成する(バイナリなので速い)

ライブラリとは、汎用性の高いプログラムを再利用可能な形にしてまとめたものです。ライブラリそれ自体を単独で実行する事はなく、他のプログラムに組み込んで呼び出す事で、ライブラリの持つ機能を利用できるようになります。
複数のプログラムから参照して使えるようにしたものを「共有ライブラリ」といいます。

プログラムの実行時に共有ライブラリを呼び出すことをダイナミックリンク(動的リンク)といいます。また、プログラムのコンパイル時にライブラリの機能を実行ファイル内に埋め込むことをスタティックリンク(静的リンク)といい、埋め込むライブラリを「静的ライブラリ」と呼びます



・cat -n [ file ] = nl -b a (空行も含め行番号)

cat -b [ ] = nl -bt(空行含めない)



・システムの復元

https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/7/html/installation_guide/chap-basic-system-recovery



・zypper

内部的にはrpm。openSUSE

zypper install emacs

zypper in emacs

などでインストールできる。



・linuxカーネル

linux自体はカーネルである。なのでカーネル単体ではOSを成さない。

そこでOSとして動くようにlinuxカーネル+ソフトウェアを詰め込んだのがディストリビューション。

(広義ではlinuxはOSとなる)



・rpm -e --nodeps postfix
rpm --erase --nodeps postfix

-e(--erase) アンインストール

--nodeps 依存関係無視



・mountコマンド = cat /etc/mtab

「デバイス」と「マウント先」どちらも指定しなかった（mount のみ実行した）場合は、現在マウントされているファイルシステムの一覧が、「/etc/mtab」ファイルの情報を元に表示されます。

「/proc/self/mounts」と「/proc/mounts」ファイルにも現在マウントされているファイルシステムの情報が格納されています。



・umask

umaskコマンドではマスク値というものを設定して、新規に作成するファイルとディレクトリのデフォルトのパーミッションを決定します。マスク値はユーザ毎に指定できます。通常「/etc/bashrc」などに設定されており、シェルの起動時にシステムのデフォルト値に戻ります。

https://atmarkit.itmedia.co.jp/flinux/rensai/linuxtips/474deffilepermssion.html





・man セクション番号

ユーザーコマンド
システムコール
ライブラリ関数(それぞれのプログラム言語などから呼び出す関数
など





・od /bin/ls  > 8進数表示

od -t x /bin/ls > 16進数(-t はフォーマット指定)



・所有グループのみ切り替える

chown :staffgroup file.txt

chgrp staffgroup file.txt

chown .staffgroup file.txt

.と:に違いはない。



・makewhatis

whatisデータベースを更新する

manで表示されるやつ。ファイルにmanに関してのメタデータのデータベースが記載される。

whatis や apropos でwhatisデータベースを確認できる。



・論理ボリューム作成の流れ

pvcreate >> vgcreate >> lvcreate

>> fs作成 >> マウント

IMG_7270.png



https://hana-shin.hatenablog.com/entry/2022/03/04/205208#1-LVMLogical-Volume-Manageとは



・runlevel コマンド

現在とひとつ前のランレベルを調べる

runlevel
N 5
先頭の文字は以前のランレベル、2つ目の文字は現在のランレベルを表しています。なお、「N」はランレベルの変更がされていないことを意味





・ps u

ユーザーのプロセスのみ表示

axは全て表示



・dump コマンド

バックアップをとるためのコマンド

dump -f 作成ファイル名 対象

(対象をバックアップ)

cf)dumpフラグ

ストレージデバイスをdump対象にするか

(fsckフラグとはアルファベット順)





・rpm と yum

rpmとはパッケージ個々」であり「yumはrpmを管理するマネージャ」である。両者共にパッケージを管理しているが、言わば管理する単位とその立ち位置が違う。

rpmファイルも個々に依存関係を記述したファイルを内包しているが、自動的に依存関係を管理してインストールするというものではない。あくまでも単体のパッケージである。





・nohup コマンド

no hung upかな？

nohup ping localhost > ping.txt &

ping localhost > ping.txt をシェル終了後も実行

コマンドをバックグラウンドで実行するには、コマンドラインの末尾に「&」を付けて実行します



・デフォルトのパーミッション

ファイル>> 「666」

ディレクトリ>> 「777」



・PCI(Peripheral Components Interconnect)デバイスを一覧表示

lspci

cat /proc/bus/pci/devices

PCIバスに接続したデバイス、ネットワークカードNICなど



・CONT(SIGCONT)

一時停止中のプロセスを再開するシグナル

ex) kill -CONT 5472



・journalctl

systemd では systemd-journald デーモンを起動しバイナリファイルにてログを記録する。バイナリなので、catなので直接は見れないため、journalctl を使用する。



・dpkg -P procmail
dpkg --purge procmail

-r --remove と異なり、設定ファイルも含め完全に削除



・rpm -F procmail-3.22-9.i386.rpm
rpm --freshen procmail-3.22-9.i386.rpm

パッケージのアップグレード(なければインストールしない



・blkid, lsblk

UUIDを表示できる。どちらもブロックデバイスを一覧表示。lsblkはツリー型



・:set tabstop(ts)=10

viでタブ幅を指定できる。



・sgid

ディレクトリにSGIDを指定しておくと、ディレクトリ内部で作成されたファイルは全てディレクトリのSGIDで指定したグループが割り振られる

chmod 2775 work
chmod g+s work



・/proc

起動中のプロセスやカーネルが認識しているハードウェアおよびシステムリソースなどの情報が格納されているディレクトリ



・HUPシグナル

HUPシグナルは、デーモンプログラムによっては、プログラムの設定ファイルを変更した後その設定ファイルをプロセスに再度読み込ませて設定を反映させる為に用いられます。
killall -HUP httpd

端末を使用するプロセスはこのシグナルを受け取ると終了します。 メモリに常駐するタイプのプロセスはHUPシグナルを受け取ると再起動するので、サーバプロセスに対して設定を再読込させたい場合や、再起動させたい場合に使われることがあります



・IDE

内蔵HDD（ハードディスクドライブ）をパソコンに接続するためのインターフェース規格。 Integrated Device Electronicsの略。 2台のHDDを接続できる。

/dev/hda　プライマリのマスター（1番目のディスク）
/dev/hdb　プライマリのスレーブ（2番目のディスク）
/dev/hdc　セカンダリのマスター（3番目のディスク）
/dev/hdd　セカンダリのスレーブ（4番目のディスク

/dev/hda1　1番目のパーティション
/dev/hda2　2番目のパーティション
/dev/hda3　3番目のパーティション



SCSIの場合

・/dev/sda　1番目のディスク
・/dev/sdb　2番目のディスク
・/dev/sdc　3番目のディスク
・/dev/sdd　4番目のディスク





・スティッキービット

/tmp などに使われてる

所有ユーザー以外の誰でも書き込みはできるが、削除されたら困るディレクトリにつける。

1000 を加えるか、+t をする。



・ヒアドキュメント　<<

https://qiita.com/take4s5i/items/e207cee4fb04385a9952

enterで入力を終了しない。



・yum 取得元ファイル

パッケージの取得元(リポジトリ)は「/etc/yum.repos.d」ディレクトリ内のファイルで設定します



・ESP

システムにおいて、物理的なマシンを起動し、ファームウエアが読み込まれた後、その後の起動シーケンスで最初にアクセスされる領域



・:!コマンド

viエディタで、:! をやると

viを閉じないで、コマンドが使える





・init q, telinit q

システムを再起動せずに、/etc/inittab の再読み込みを行う

cf)/etc/inittab

デフォルトのランレベルの指定、デバイスなどの初期化、initの起動、ブート時の処理、ランレベルごとのrcスクリプトの実行などを指示するファイル。

OSの起動のための、init ファイルの設定が書かれている。

https://linuc.org/study/knowledge/504/



・updatedb

locate が使用するデータベースを更新するコマンド

etc/updatedb.conf が設定ファイル



・/var/log/messages

linux でメインで使用されるログ(カーネルのなどが観れる)



・/etc/ld.so.cache > バイナリ検索データ

/etc/ld.so.conf を参照して作られる

共有ライブラリの参照用

ldconfig で作成できる。



・lspci

PCIデバイスの情報を表示できる。



・grub2 の設定

https://qiita.com/saito_now/items/acacf3f5830fdfb90283





・dd if=/dev/zero of=/dev/sda bs=446 count=1

ブートローダ部分のみがクリアされる。

of の /dev/sda が上書きされる。 /dev/zero はクリアするための特殊領域

bs=446 ブートローダ部分

パーティションテーブル 16b 毎に、1-4のパーティション(64b)

ブートシグニチャ(2b)



・/proc/dma

メモリと直接やり取りする(CPUを介さない)方式。DMAチャネルを通じてアクセスする。

上記のディレクトリに情報保存。



・pstree = ps f

ツリー状にだす。 ps f は完全なフォーマット。



・defaults

defaults」を指定した場合は、「async, auto, dev, exec, nouser, rw, suid」マウントオプションが指定されたことになります



・$ export PATH=$PATH:/usr/local/test

環境変数PATHへ追加方法

: が区切り文字らしい



・.bash_history

history が参照してる場所



・fdisk -l /dev/sda

パーティションテーブルを確認する



・mkdir -m 700 dir

アクセス権を指定して作成



・pgrep -u test

実行ユーザーが test のプロセスをひっぱる



・yum

設定ファイルは「/etc/yum.conf」、パッケージの取得元（リポジトリ）は「/etc/yum.repos.d」



・xz -l configure.xz

xz ファイルの詳細情報を表示



・/etc/hosts

「/etc/hosts」ファイルは、ホスト名とIPアドレスを対応させるためのファイル

https://linuc.org/study/knowledge/506/









・lsusb >> 接続usb情報を表示

cat /proc/bus/usb/devices





・usb のマウント

USBメモリのように外付けのドライブを接続する際、接続する順番や環境によって「/dev」ディレクトリ配下のどのデバイスファイルとしてマウントされるのかが定まっていません。そのため特定のデバイスをいつも同じようにマウントしたい場合は、デバイスのUUID（Universally Unique Identifier: 汎用一意識別子、全世界で重複が起きないように生成される一意な値）を確認し、「/etc/fstab」のマウント設定のデバイス名に記述しておくとよいでしょう



・lsmod

cat /proc/modules

カーネルモジュールの情報を表示する

cf)カーネルモジュール

カーネルが使用する機能を独立してパーツにしたもの。

modprobe コマンドで依存関係を管理しながらロード、アンロードできる



・オブジェクトストレージ

データをオブジェクトという単位で扱うストレージの仕組みです。AWSのAmazon S3のように、ユーザはインフラや、用途によっては開発環境も意識することなくサービスを利用できるので、PaaS（Platform as a Service）またはSaaS（Software as a Service）が提供するサービスと分類されます。



・ブロックストレージ

HDDのこと



・exFAT

フラッシュドライブ用のファイルシステムらしい

microsoftが権利を持ってるので、直接linuxはサポートしてない

そのため、LinuxでのexFATの利用にはFUSE（Filesystem in Userspace）が必要

https://www.partitionwizard.jp/amp/partitionmagic/differences-between-fat32-exfat-and-ntfs.html

FaT32との互換はない



・/usr/local/bin

/usr/local/etc

ホスト固有のプラグラムを置く(個人作成など)



・仮想化

ホスト型 >> 個人pc、OSの上に仮想化ソフトウェア

ハイパーバイザー型>>法人など、OSなしでダイレクトに物理サーバーに対してハイパーバイザーを導入して仮想化(OSを介さないので高速、仮想化のみなので容量の無駄もない)

コンテナ型>>OSは物理マシンの一つを共有し(?)、複数の環境を生み出す

(ゲストosがないのでさらに高速)

https://www.rworks.jp/system/system-column/sys-entry/21776/



・mkdir -p dir1/dir2

中間ディレクトリ作成



・systemd-journaldはsystemdから起動したプロセスの標準出力やsyslogへのログメッセージをバイナリ形式で記録

journalctl コマンドで確認できる(cat はバイナリなので確認できない)





・find /etc -name httpd.conf -print
/etc/httpd/conf/httpd.conf

改行区切りで出す



・正規表現

「p.*t」のパターンに合致するのは、一行目の「ping-t」ではなく、先頭の「p」から「site」の「t」までです。
正規表現には、最も左から、最も長く一致するものにマッチするという法則



・uname

使用中のシステム情報をだす

uname -a で詳細情報



・/proc/scsi/scsi

SCSIデバイスに関する情報は「/proc/scsi/scsi」ファイルで確認できます。
cf)scsi

SCSIは、コンピュータと周辺機器を接続するための インターフェイス

HDD.CDなどの記憶媒体。



・pkill mycommand

killall -SIGTERM mycommand

killall -s 15 mycommand

すべてmycommand を実行するプロセス終了



・cat /proc/meminfo

メモリの使用状況は「/proc/meminfo」ファイルで確認できます。



・/etc/mtab

現在マウントされてる情報



・/proc/ioports

I/Oポートアドレスとは周辺機器(デバイス)とCPUがデータをやり取りする際に使用する16ビットのアドレスのこと

http://www.linux-beginner.com/linux_kihon268.html



・/var/log/messages

カーネルのログが記録されるなど、Linuxでメインで使用されるログファイルは「/var/log/messages」



・typeコマンド

コマンドの種類を表示



・rescueモードの解除

systemctl default」コマンドの実行、または「^D（Ctrl-D 押下）」によって通常モードに戻せる

systemctl rescue」コマンドはデフォルトのターゲットを変更しませんので、「systemctl reboot」コマンドで再起動すると、デフォルトのターゲットで起動してきます。



・tmux と screen

端末多重化ソフトウェアで、1つのターミナルで操作しているシェルから実行したtmux上で複数の仮想端末を操作できるため、 ターミナルを複数開くことなく複数のサーバへログインしたり、それぞれの仮想端末で別々のプログラムを実行できるようになるため、 より効率的に作業が行える。 →つまりターミナルを新規タブとか開く必要がない

https://type.jp/s/itips/software/i_20160122.html





・シェルのメタキャラクタと正規表現は別か！

? >> 任意一文字、0,1回の繰り返し



・/lib   /usr/lib

https://linuc.org/study/knowledge/545/





・/usr/bin  bin sbin

https://linuc.org/study/knowledge/544/







・予約領域

root 用の領域が用意される、緊急時などにsyslogd などの root 権限で実行されるコマンドが実行できるように。

デフォルトは5%

tune2fs -m 2 /dev/sda1

2%へ変更





・サービス

linux でのアプリケーションの呼称

















いつここ












