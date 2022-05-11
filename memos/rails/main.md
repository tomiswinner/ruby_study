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

