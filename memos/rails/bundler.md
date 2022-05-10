+ そもそも何のために必要なのか？
プロジェクト毎の gem 管理のため。<br>
依存関係やバージョンを全て Gemfile に記載して、勝手なアップデートなどが起きたりしないようにして、アプリがどんな環境でも動くことを保証する。<br>



+ bundle exec
Gemfile.lock に記載の gem を実行するコマンド<br>



+ bundle update
bundle update は Gemfile.lock を無視して再度インストールしなおすので危険。要注意。<br>

+ Gemfile と Gemfile.lock
Gemfile は使う gem を定義したもの。<br>
Gemfile.lock は実際にインストールした gem のバージョンまで記載し、gem を lock(固定)したもの<br>

