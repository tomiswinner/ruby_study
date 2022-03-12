# ++capistrano
+ staging
	  環境を変数として定義できる。
	  production として定義すれば、その環境設定をすぐにロードできる。
	  
+ ++capfile
	  capfile は設定をするためのテンプレートを作成してくれる。
	  deploy.rb と stage file を編集する必要がある。
	  
	  
 アプリの準備
	github などに準備しておくこと。

	->cap install で capfile を生成
	capfile は rails(rake) に含まれる。 ※ rake = rails の昔
	
	capistrano は 3つの role という概念をもつ
	->web  app  db  である

+ ruby-build
rubyの各バージョンのインストールを簡単にしてくれる。
rbenv に使用されているgem
rbenv install コマンドが使えるのはこれのおかげ

# capistrano 一連の動作
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

## deploy.rb 流れ

1. set :application, アプリ名

2. set :scm, git (scm = source code management)

3. set :repository, githubのURL      ※サーバー側でgithub への ssh接続は設定しておくこと

4. set :user, capistranoをサーバーで実際に操作するユーザー(このユーザーはRW権限が必要、変数deploy_toにて指定する)

5. set :stages, []  環境をセット

6. set :default_stage

7. 環境毎の設定のため、config/deploy/環境名.rb を作成

8. 環境名.rbにアプリ用のサーバーの設定をする<br>
server "my_fancy_server.com", :app, :web, :db, :primary => true,set :deploy_to, "/var/www/fancy_shoes"

9. cap deploy :setup
<br>アプリのルートディレクトリから実行すること、このコマンドでは、capistranoはアプリ用のサーバーにssh接続し、deploy_to のディレクトリへcapistranoの作業用の特殊なフォルダを作る


10. cap deploy:check　　　　ダミーのプログラムを展開し、問題がないか検証してくれる


11. cap 環境名:deploy    にて実際にデプロイを行う


そのほかにもさまざまなオプションがある

詳細はhttp://guides.beanstalkapp.com/deployments/deploy-with-capistrano.html


### ※staging 環境(検証環境？)
production 環境のコピーで、公に公開せずにproduction をテストできるらしい<br>
https://www.commonplaces.com/blog/web-development-what-is-staging/<br>
[環境について]https://techracho.bpsinc.jp/morimorihoge/2019_12_02/84025<br>


※populate >> put values to variables
インスタンス化

    
+ :format
	defalut :airbrussh
	SSHKit なるもので使われる。
	他オプションとして、 :dot , :pretty がある
	cf) 
	+ aribrussh >> ssh において log をきれいに表示（フォーマット）してくれるもの？
	基本いじらなくてよさそう。
	+ SSHKit >> capistrano が ssh の接続に関して使用しているツールキット(gem)
	[こちらがわかりやすいかも](https://48n.jp/blog/2016/06/14/learn-ssh-kit/)

+ :pty
pseudo-terminal のこと？


