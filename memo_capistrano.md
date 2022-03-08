- ++capistrano
  docs
  github公式
  
  
	- staging
	  環境を変数として定義できる。
	  production として定義すれば、その環境設定をすぐにロードできる。
	  
	  
	- ++capfile
	  capfile は設定をするためのテンプレートを作成してくれる。
	  deploy.rb と stage file を編集する必要がある。
	  
	  
	- アプリの準備
	  github などに準備しておくこと。
	  >>cap install で capfile を生成
	  capfile は rails(rake) に含まれる。 ※ rake = rails の昔
	  
	  capistrano は 3つの role という概念をもつ
	  >>web  app  db  である

ruby-build
rbenv に使用されているgem
rubyの各バージョンのインストールを簡単にしてくれる。
rbenv install コマンドが使えるのはこれのおかげ

capistrano 一連の動作
1.ssh 接続でサーバーへ接続
2.github などからアプリのコードを取得
3.各種デプロイに必要なタスクを自動でしてくれる
http://guides.beanstalkapp.com/deployments/deploy-with-capistrano.html

capfile は capistrano に実際にタスクなどをしてもらうためのファイル
config/deploy.rb が capistrano に渡すマニュアル

cf) capistrano-ext
deploy.rb を他のstageにも使いまわせるようにするgem??
>>extを使うと簡単にcapistranoの環境を変更できる
具体的には、config/deploy.rb に共通の設定、環境ごとの設定をconfig/deploy/環境名.rb に書く

deploy.rb 流れ

set :application, アプリ名
set :scm, git (scm = source code management)
set :repository, githubのURL      ※サーバー側でgithub への ssh接続は設定しておくこと
set :user, capistranoをサーバーで実際に操作するユーザー(このユーザーはRW権限が必要、変数deploy_toにて指定する)
set :stages, []  環境をセット
set :default_stage
環境毎の設定のため、config/deploy/環境名.rb を作成
環境名.rbにアプリ用のサーバーの設定をする　　　　server "my_fancy_server.com", :app, :web, :db, :primary => true,set :deploy_to, "/var/www/fancy_shoes"
cap deploy :setup             アプリのルートディレクトリから実行すること、このコマンドでは、capistranoはアプリ用のサーバーにssh接続し、deploy_to のディレクトリへcapistranoの作業用の特殊なフォルダを作る
cap deploy:check      ダミーのプログラムを展開し、問題がないか検証してくれる
cap 環境名:deploy    にて実際にデプロイを行う
そのほかにもさまざまなオプションがある
詳細はhttp://guides.beanstalkapp.com/deployments/deploy-with-capistrano.html
※staging 環境(検証環境？)
production 環境のコピーで、公に公開せずにproduction をテストできるらしい
https://www.commonplaces.com/blog/web-development-what-is-staging/
[環境について]https://techracho.bpsinc.jp/morimorihoge/2019_12_02/84025
※populate >> put values to variables
インスタンス化

    