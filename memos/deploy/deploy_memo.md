# デプロイ手順(puma, nginx)
+ 画像の記述方法が変更されている。 url("hoge.jpg") >> image-url("hoge.jpg") (local)

+ プリコンパイル

+ EIP のインスタンスへの割り当て(EC2 から EIP を確認できる)

+ データベース設定

  - データベースサーバを用意する。(aws なら RDSを使用しているはず)

  - DB 操作用のクライアントソフトを用意する(remote)

  - ~/config/database.yml を設定する。(local)

  - " create database [appname] " で DB がリモートに作成されている(remote)

+ puma
  - config/puma.rb を設定する(local)

	+ [puma config](https://web-camp.online/lesson/curriculums/246/contents/2234)<br>

  - "rails s -e production "(remote) にてアプリサーバ puma 起動

+ nginx
  ※どちらも sudo 権限が必要
  - /etc/nginx/nginx.conf の設定　　[こちら](https://web-camp.online/lesson/curriculums/246/contents/2237)<br>

  - /etc/nginx/conf.d/[app_name].conf の設定

  - " sudo nginx - t " で構文チェック

  - " sudo chown -R ec2-user /var/lib/nginx " で nginx の実行権限を ec2-user へ。

  - " sudo systemcctl restart nginx " にて設定反映

  - " sudo systemcctl restart nginx " にて設定反映


+ その他

  - ImageMagick がインストールされている（オプション）(remote)

  - rbenv, ruby がインストールされている(remote)

  - Bundler がインストールされている(remote)

  - rails がインストールされている (remote)
    + sudo yum -y install patch libyaml-devel zlib zlib-devel libffi-devel make autoconf automake libcurl-devel sqlite-devel mysql-devel

    - Node.js がインストールされている(remote)

  - git の接続ができる(remote)
    - git clone してある

  - config/master.key がコピーされている(local >> remote)

  - .env がコピーされている(local >> remote)

  - " bundle install --path vendor/bundle --without test development " の実行(remote)

  - " bundle exec rails assets:precompile RAILS_ENV=production " の実行(remote)

  - " bundle exec rails db:migrate RAILS_ENV=production " の実行(remote)


```config/database.yml
production:
  <<: *default
  database: <%= ENV['DB_DATABASE'] %>
  adapter: [データベース名]
  encoding: utf8mb4
  charset: utf8mb4
  collation: utf8mb4_general_ci
  host: <%= ENV['DB_HOST'] %>
  username: <%= ENV['DB_USERNAME'] %>
  password: <%= ENV['DB_PASSWORD'] %>
```


```
config/puma.rb
bind "unix://#{Rails.root}/tmp/sockets/puma.sock"
rails_root = Dir.pwd
# 本番環境のみデーモン起動
if Rails.env.production?
  pidfile File.join(rails_root, 'tmp', 'pids', 'puma.pid')
  state_path File.join(rails_root, 'tmp', 'pids', 'puma.state')
  stdout_redirect(
    File.join(rails_root, 'log', 'puma.log'),
    File.join(rails_root, 'log', 'puma-error.log'),
    true
  )
  # デーモン
  daemonize
end
```
