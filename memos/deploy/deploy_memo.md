# デプロイ手順(puma, nginx)
+ プリコンパイル

+ データベース設定
  - ~/config/database.yml を設定する。(local)

  - " create database [appname] " で DB がリモートに作成されている(remote)

+ puma
  - config/puma.rb を設定する(local)

+ nginx

+ その他

  - ImageMagick がインストールされている（オプション）(remote)

  - rbenv, ruby がインストールされている(remote)

  - Bundler がインストールされている(remote)

  - rails がインストールされている (remote)
    - sudo yum -y install patch libyaml-devel zlib zlib-devel libffi-devel make autoconf automake libcurl-devel sqlite-devel mysql-devel

    - Node.js がインストールされている(remote)

  - git の接続ができる(remote)
    - git clone してある

  - config/master.key がコピーされている(local >> remote)
    - .env がコピーされている(local >> remote)


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
