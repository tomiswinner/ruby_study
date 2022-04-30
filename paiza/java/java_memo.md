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


