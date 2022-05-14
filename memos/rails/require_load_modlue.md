+ モジュールとクラス
[これがわかりやすい](https://qiita.com/fukumone/items/2dd4d2d1ce6ed05928de)<br>
クラス >> オブジェクトになれる。インスタンス化して使う。<br>
モジュール >> オブジェクトになれない。クラスに取り込んだりして使う<br>


+ config.autoload_paths
rails 起動時に自動で読み込みをするフォルダのパスの変数。<br>
config/application.rb や config/environments/[smth].rb に追加すれば拡張できる。<br>
LOAD_PATH なる変数に config.autoload_paths にかかれている内容は追加されるらしい。<br>
" ruby -e 'puts $LOAD_PATH' " にて $LOAD_PATH が確認できる。なるほど。<br>
	- そもそもデフォで設定されている autoload_paths は？
		" rails runner 'puts ActiveSupport::Dependencies.autoload_paths'" で確認できる。<br>


	- cf) __FILE__
		現在の実行しているファイル名が返ってくる。擬似変数<br>
		__dir__ は現在実行中のディレクトリ。メソッド。<br>
		[詳細はこちら](https://k-koh.hatenablog.com/entry/2019/12/20/143740)<br>

	- cf) File.expand_path >> パスを評価する。irb で動作確認してみるのが手っ取り早い。<br>

+ require
1.フルパス or 2.ファイル のどちらか渡す。フルパスの場合、記載の通りの場所を探す。<br>
ファイル名の場合、事前に定義されたディレクトリから、一致するものを探す<br>
[こちら](https://www.thoughtco.com/requre-method-2908199#:~:text=The%20require%20method%20takes%20the,look%20there%20for%20the%20file.)<br>
 if the argument is a shortened name, the require method will search through a number of pre-defined directories on your system for that file. Using the shortened name is the most common way of using the require method.<br>
※現在地からのパスはだめなんだ。だからか。<br>

$LOAD_PATH は、require に shortened name が渡された際の、捜索場所である。<br>

~~Rails が起動すると、config/boot.rb が起動し、boot.rb によって $LOAD_PATH がセットされる。<br>
これが Rails における、 pre-defined なディレクトリとなる。<br>
[ここがわかりやすいよ](https://stackoverflow.com/questions/417179/how-does-ruby-know-where-to-find-a-required-file)<br>~~
情報が古すぎた。

	- require_relative  >> ファイル名を現在のディレクトリからの相対パスで探しに行く。<br>


+ rails の初期化プロセス
1. ~/.rvm/gems/ruby-[ver]/bin/rails のファイルが起動<br>
	require は config/boot, rails/commands の２つ<br>

2. config/boot.rb にて、$BUNDLE_GEMFILE が設定される<br>
	require は bundler/setup<br>

3. rails/commands.rb にて、rails のコマンドのエイリアスなどを指定<br>


+ 組み込み変数
ruby が用意した変数のこと。<br>
$LOAD_PATH >> ロードファイルの検索先。<br>
$0 >> 実行したファイル名が自動格納　など。<br>

+ --path vendor/bundle
プロジェクト固有のディレクトリに gem をインストールする。<br>
こちらがベストプラクティスとされているらしい<br>




