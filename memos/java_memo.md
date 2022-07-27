#### **アンダースコア変数**
変数にアンダースコアをつけるケースがいくつか決まっている<br>
[詳細はこちらのサイトがよい](https://lubryqate.com/variable_with_under_score/)<br>
ケースとしては以下<br>
 - クラス内で自身が持つメンバ変数として明記する<br>





#### **java で bash-completion がうまくいかない**
[$CLASSPATHに追加さてないんじゃない？](https://askubuntu.com/questions/691206/bash-auto-completion-wont-work-for-java-command)<br>
-> classpath に追加したけど、だめでした。また別の問題っぽい<br>


#### [これっぽい、/usr/share/bash-completion/java_ファイルの一節](https://superuser.com/questions/1484520/bash-auto-completion-not-working-after-certain-command)<br>
~~~
# available path elements completion
_java_path()
{
    cur=${cur##*:}
    _filedir '@(jar|zip)'
}
~~~
-> 違った。java を追加したけどうまくいかず。。<br>
jar ファイルを適当に作成してみたが、それも補完できず。。ただ、なぜかディレクトリの補完はされる。。意味わからん。<br>
#### complete コマンド<br>
-> /usr/share/以下のは bash-completion がインストールされてる場合の設定ファイルで、<br>
bash-completion がない場合は、/etc/bash_completion.d/ 以下に個別配置されているらしい<br>
/etc/bash_completion.d/ 以下の設定ファイルをいじくるのが、complete コマンドらしい、、、bash_completion があるから関係なさそうだなー<br>




-> 違った。java を追加したけどうまくいかず。。<br>
jar ファイルを適当に作成してみたが、それも補完できず。。ただ、なぜかディレクトリの補完はされる。。意味わからん。<br>

-> 違った。java を追加したけどうまくいかず。。<br>
jar ファイルを適当に作成してみたが、それも補完できず。。ただ、なぜかディレクトリの補完はされる。。意味わからん。<br>



#### java で max を求める方法
+ stream を使う<br>
~~~java
import java.util.\*;
IntStream inst = Arrays.stream(配列);
OptionalInt opin = inst.max();
int maxint = opin.getAsInt();
~~~
+ Stream ってなんやねん❓❓<br>
配列やコレクションをうまく処理するための java8 の機能、、らしい<br>
今までめんどくさかった配列への処理を steam を介せば簡単になるよーって話っぽいわ<br>



#### ジェネリック型宣言 generic
classs クラス名<E>{<br>
	E フィールド名; <br>
}<br>
このとき、クラス名 = raw type(原型) と呼ばれる。<E> の中で型を指定することで、インスタンス化を汎用的にできる<br>




#### 二次元配列の出力
import java.util.Arrays;<br>
System.out.println(Arrays.deepToString(二次元配列));　が一番楽そう<br>
[これ以外にも方法はあるのでこちらを参照](https://www.delftstack.com/ja/howto/java/java-print-2d-array/)<br>



#### ()? 条件演算子
int score = 76;
String result = (score > 70)? "yeah" : "booo";
>> OK 

#### implements
部品を実装するのが、implements<br>
run と close を runclose クラスとして実装して、メソッドを書けば、Run クラスとしても、Close クラスとしても機能する。<br>
- なにがいいのか？
クラスの継承関係がなくても、同じメソッドを implements していることで、引数として受け取って同じメソッドを実行できる（メソッド名は implements している部品が共通するので）<br>
つまり、違うクラスなのに、同じインターフェースとして引数へ渡せるんですね。<br>
- ほかにも、interface として役割を切り出せるっていうのも利点だね。ちなみに Iterable みたいな ~~able は interface<br>
こういうデフォルトの interface を自作クラスに導入することによって、簡単に機能導入できるのも利点<br>
[こちらがよく解説されているよ（長いけど）](https://www.bold.ne.jp/engineer-club/java-implements#implements)<br>




#### Map の value で sort する
List<Entry<Integer, Integer>> list = new ArrayList<>(map1.entrySet());<br>
list.sort(Entry.comparingByValue());<br>
でできる。<br>
- map.entrySet() -> key + value の組み合わせの Map.Entry が要素となる Set を返す。<br>
- エントリー -> map における key + value の１セットのことをエントリーという。なんでやねん。。。<br>
- Map.Entry が要素となる list を作って、そのエントリにたいしてそれぞれ、comparingByValue()で比較をする<br>
- Entry.comparingByValue() -> Map.Entry を比較するコンパレータを返す<br>
[map sort の方法の元リンクはこちら](https://www.delftstack.com/ja/howto/java/how-to-sort-a-map-by-value-in-java/)<br>
[comparator/comparable についてはこちら](http://teqspaces.com/Java/7)  むずすぎる...<br>


#### classpath と外部ライブラリの使用
jar ファイル -> .class を集約したファイル、外部ライブラリ<br>
jarファイルを使用するには、classpath を指定する<br>
	- 環境変数 CLASSPATH の設定
	- java コマンド実行時に -classpath オプションにて指定
cf) build path は Eclipse を使用するうえでの用語(?)、とりあえず意識しなくてもよい<br>




#### java の inf
Integer.MAX_VALUE を使用すると、python の inf みたいなことをできる<br>


#### Javadoc と アノテーション
- javadoc
python の docstring(help()で呼び出される、メソッドなどについての使い方文)に相当するもの<br>
残念ながら、help関数みたいに、CLI上で確認できるわけじゃないっぽい...?<br>
javadoc で 公式のドキュメントを見るのが手っ取り早いかもや<br>
- アノテーション
javadoc は for human. であれば、javadoc for 機械。<br>






#### printf
java には python や ruby にあるような f'{val}' がない。<br>
全く同じものはないので、printf や format で代用する<br>



#### main メソッド
java は main メソッドがエントリポイントとなる言語<br>
(python とかは先頭行から実行されていくのかな)<br>
java のメインメソッドは、public static void main(String[] args) でなければならない。（エントリポイントとなる条件）<br>
[こちらがリンク](https://www.bold.ne.jp/engineer-club/java-main)<br>

#### java のインストール（amazon linux 2, OpenJDK9)
[こちらを参照ください](https://weblabo.oscasierra.net/installing-openjdk9-on-centos7/)<br>
cf) alternatives
既存ファイルに新しい名前をつけて管理するためのもの<br>
alternatives --install /usr/bin/java java /opt/jdk-.../bin/jar 1 <br>
1. /usr/bin/java -> /usr/bin に指定した名前で、/etc/alternatives 配下へのシンボリックリンクをはる ex) java -> /etc/alternatives/java<br>
2. /etc/alternatives/java -> /opt/jdk-.../bin/java へのシンボリックリンクとなっている<br>
[alternatives で java のバージョン管理を行うにはこちら](https://necoyama3.hatenablog.com/entry/20110505/1304587888)<br>
[ちなみにopenjdk のダウンロードはこちらから](https://jdk.java.net/archive/)





#### amazon correto
amazon がサポートする Open JDK


cf) Java SE <br>
Oracle が提供する Java の仕様。これをクリアしてると Java SE と名乗れる、みたいな。<br>
- OpenJDK
Java SE 準拠のオープンソースな Java<br>
- JDK Java Development Kit
Java でアプリを開発する用のキット。コンパイラとかそういうのもセットになってる。
要は JDK がインストールされれば、java の開発・コンパイル・実行、すべてができる！

#### StringBuilder
Stringクラスは書き換え不可能。
ex) String str = "a";
str = "b"; としたとき、変更されるのは参照値のみ。
これは文字列の連結などでも同様、余計なメモリを食うのが問題。なので、StringBuilder を使用する。

#### stream とは
ストリームとは、データを扱いやすくするために切り分けた一単位のこと。
ストリームに切り分けられた後、バッファにためる。
Read はこのバッファを読み込み、Write はバッファに書き込む。
切り分けると、入力の形がなんであれ、ストリームという形で扱えばいいので、
（要はインターフェースである）操作が楽になる。

#### 自作クラスを使用する
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


