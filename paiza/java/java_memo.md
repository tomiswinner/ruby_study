+ classpath と外部ライブラリの使用
jar ファイル -> .class を集約したファイル、外部ライブラリ<br>
jarファイルを使用するには、classpath を指定する<br>
	- 環境変数 CLASSPATH の設定
	- java コマンド実行時に -classpath オプションにて指定
cf) build path は Eclipse を使用するうえでの用語(?)、とりあえず意識しなくてもよい<br>




+ java の inf
Integer.MAX_VALUE を使用すると、python の inf みたいなことをできる<br>


+ Javadoc と アノテーション
- javadoc
python の docstring(help()で呼び出される、メソッドなどについての使い方文)に相当するもの<br>
残念ながら、help関数みたいに、CLI上で確認できるわけじゃないっぽい...?<br>
javadoc で 公式のドキュメントを見るのが手っ取り早いかもや<br>
- アノテーション
javadoc は for human. であれば、javadoc for 機械。<br>






+ printf
java には python や ruby にあるような f'{val}' がない。<br>
全く同じものはないので、printf や format で代用する<br>



+ main メソッド
java は main メソッドがエントリポイントとなる言語<br>
(python とかは先頭行から実行されていくのかな)<br>
java のメインメソッドは、public static void main(String[] args) でなければならない。（エントリポイントとなる条件）<br>
[こちらがリンク](https://www.bold.ne.jp/engineer-club/java-main)<br>

+ java のインストール（amazon linux 2, OpenJDK9)
[こちらを参照ください](https://weblabo.oscasierra.net/installing-openjdk9-on-centos7/)<br>
cf) alternatives
既存ファイルに新しい名前をつけて管理するためのもの<br>
alternatives --install /usr/bin/java java /opt/jdk-.../bin/jar 1 <br>
1. /usr/bin/java -> /usr/bin に指定した名前で、/etc/alternatives 配下へのシンボリックリンクをはる ex) java -> /etc/alternatives/java<br>
2. /etc/alternatives/java -> /opt/jdk-.../bin/java へのシンボリックリンクとなっている<br>
[alternatives で java のバージョン管理を行うにはこちら](https://necoyama3.hatenablog.com/entry/20110505/1304587888)<br>
[ちなみにopenjdk のダウンロードはこちらから](https://jdk.java.net/archive/)





+ amazon correto
amazon がサポートする Open JDK


cf) Java SE <br>
Oracle が提供する Java の仕様。これをクリアしてると Java SE と名乗れる、みたいな。<br>
- OpenJDK
Java SE 準拠のオープンソースな Java<br>
- JDK Java Development Kit
Java でアプリを開発する用のキット。コンパイラとかそういうのもセットになってる。
要は JDK がインストールされれば、java の開発・コンパイル・実行、すべてができる！

+ StringBuilder
Stringクラスは書き換え不可能。
ex) String str = "a";
str = "b"; としたとき、変更されるのは参照値のみ。
これは文字列の連結などでも同様、余計なメモリを食うのが問題。なので、StringBuilder を使用する。

+ stream とは
ストリームとは、データを扱いやすくするために切り分けた一単位のこと。
ストリームに切り分けられた後、バッファにためる。
Read はこのバッファを読み込み、Write はバッファに書き込む。
切り分けると、入力の形がなんであれ、ストリームという形で扱えばいいので、
（要はインターフェースである）操作が楽になる。

+ 自作クラスを使用する
メインで動かしたいファイル >> Test.java
自作クラス >> Person.java
1. 同じディレクトリ内に使用したい自作クラスをおく
2. 作成した Test.java を " javac Test.java " のようにコンパイルする（直接 java Test.java では使えない）
3. コンパイル後、Person.class, Test.class が作成されているのを確認。
4. " java Test " を実行（拡張子つけるとエラー）
>>ディレクトリが違う場合でも対応させるには？<br>
CLASSPATH を設定する。<br>
1. 環境変数 $CLASSPATH を設定することでサブディレクトリからも読み取りをしてくれるようになる。<br>
[詳細はこちら](https://java.keicode.com/lang/how-to-compile-multiple-files.php#1)<br>


