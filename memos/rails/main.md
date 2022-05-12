+ モジュールとクラス
[これがわかりやすい](https://qiita.com/fukumone/items/2dd4d2d1ce6ed05928de)<br>
クラス >> オブジェクトになれる。インスタンス化して使う。<br>
モジュール >> オブジェクトになれない。クラスに取り込んだりして使う<br>


+ config.autoload_paths
rails 起動時に自動で読み込みをするフォルダのパスの変数。<br>
config/application.rb や config/environments/[smth].rb に追加すれば拡張できる。<br>
LOAD_PATH なる変数に config.autoload_paths にかかれている内容は追加されるらしい。<br>
" ruby -e 'puts $LOAD_PATH' " にて $LOAD_PATH が確認できる。なるほど。<br>

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

Rails が起動すると、config/boot.rb が起動し、boot.rb によって $LOAD_PATH がセットされる。<br>
これが Rails における、 pre-defined なディレクトリとなる。<br>
[ここがわかりやすいよ](https://stackoverflow.com/questions/417179/how-does-ruby-know-where-to-find-a-required-file)<br>

	- require_relative  >> ファイル名を現在のディレクトリからの相対パスで探しに行く。<br>


