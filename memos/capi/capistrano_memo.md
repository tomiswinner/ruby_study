# 一連の流れ
1. gem に capistrano を記述
2. bundle exec cap install を実行する。
	※ 既存の Capfile, capfile がないように。
3. [アプリルートdir]/config/deploy.rb を編集し、自動実行するタスクを記述。


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
deploy.rb は capistrano で使用する変数を宣言している。<br>
set で設定。 fetch で使用する。<br>

+ set :application [github リポジトリ名]

+ set :scm, git (scm = source code management)

+ set :repository, githubのURL      ※サーバー側でgithub への ssh接続は設定しておくこと

+ set :user, capistranoをサーバーで実際に操作するユーザー(このユーザーはRW権限が必要、変数deploy_toにて指定する)

+ set :stages, []  環境をセット

+ set :default_stage

環境毎の設定のため、config/deploy/環境名.rb を作成

環境名.rbにアプリ用のサーバーの設定をする<br>
ver "my_fancy_server.com", :app, :web, :db, :primary => true,set :deploy_to, "/var/www/fancy_shoes"

cap deploy :setup
>アプリのルートディレクトリから実行すること、このコマンドでは、capistranoはアプリ用のサーバーにssh接続し、deploy_to のディレクトリへcapistranoの作業用の特殊なフォルダを作る

 cap deploy:check　　　　ダミーのプログラムを展開し、問題がないか検証してくれる

 cap 環境名:deploy    にて実際にデプロイを行う<br>

set :ssh_optinos  >>  ssh の設定


## config/deploy/[stage_name].rb
server, user, roles を規定する。<br>
ロールについては[こちらがわかりやすい](https://techracho.bpsinc.jp/hachi8833/2021_03_10/93741)<br>
Rails なら nginx は静的コンテンツ用のサーバーとなるので、 web ロールとなる。操作対象のサーバーを指定するタグみたいな。独自もOK<br>


## 


## capistrano の亜種たち
基本につかえるタスクを追加するためだけのものである。<br>

+ capistrano_rbenv の deploy.rb
- set :rbenv_type, :user
	どこにインストールされている rbenv を使用するか指定する。<br>
	ホームディレクトリ >> :user      /usr/local/rbenv >> :system
- set :rbenv_ruby, [ruby のバージョン]
- append :linked_files  git にアップロードしてないものを指定（.env, config/master.key など）<br>
手動で、sharedディレクトリ以下に scp などしておかないといけない。<br>
capistrano では、デプロイされた内容は keep-release に設定されただけ、保存される。（symlink が貼られる)<br>
ただし master.key や database.yml などリリースによって変更がないものは shared ディレクトリに保存される。shared ディレクトリに置くものが、 linkedfiles となる。<br>


+ capistrano3_puma
capistrano3-puma をデフォルト設定で使用すると、config/puma.rb などは完全に無視される<br>
puma.rb は shared ディレクトリに capistrano が勝手に作成する。(" cap production puma:config ")<br>
元の config/puma.rb などを使用する場合、config/deploy.rb にて、set :puma_conf でパスを設定する必要がある<br>
[qiita 記事こちら](https://qiita.com/metheglin/items/227d14fff67d73d16cc2)<br>
for Capfile<br>
- install_plugin Capistrano::Puma  デフォで必要
- install_plugin Capistrano::Puma::Daemon
	puma daemon or Systemd サービスマネージャをどちらか選ぶ。<br>
	よくわからないが、Capistrano::Puma::[なにか] を install_plugin するとエラーが起きる。意味不明<br>





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

## errors
+ ed25519 
[こちらに書いてある通り、現在 gem が足りないポイ](https://k-koh.hatenablog.com/entry/2020/04/06/125037)<br>

+ bundle
以下のようなエラー。リモートとローカルで bundler のバージョンが違うのが原因っぽかった。<br>
bundler は ruby 2.6 とかは bundler のバージョン下げた方がよいっぽい？[こちら](https://qiita.com/aykusu/items/398a244ff14d39035624)<br>
[リンクはこちら](https://qiita.com/aykusu/items/398a244ff14d39035624)<br>

問題はsassc2.4 にあった。仕様により、2.4以降はインストールにとても時間がかかる。<br>
そのため、capistranoで時間(?)のためエラーが起きていた。（しかもめっちゃ時間かかった）<br>
Bootstrap の依存などが存在するが、sassc ~>2.0 の依存のため、2.1.0を指定してインストールすればOK<br>
sassc 自体は依存関係にて自動DLされるので、一旦削除して、gemファイルに記載し、bundle update <br>
Gemfile.lock には記載があっても、gem list ででてこない、手動で gem install したらいいんか？<br>
一旦それで解決した。<br>

[バージョンについて](https://haayaaa.hatenablog.com/entry/2018/10/29/235952)<br>
[sassc2.4の問題](https://github.com/sass/sassc-ruby/issues/204)<br>




bundle stderr: The deployment setting requires a Gemfile.lock. Please make sure you have
checked your Gemfile.lock into version control before deploying.
(Backtrace restricted to imported tasks)
cap aborted!
SSHKit::Runner::ExecuteError: Exception while executing as ec2-user@18.177.75.218: bundle exit status: 16
bundle stdout: Nothing written
bundle stderr: The deployment setting requires a Gemfile.lock. Please make sure you have
checked your Gemfile.lock into version control before deploying.

