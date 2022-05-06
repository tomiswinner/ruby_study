## SSL + ELB + Rails 用の設定
[こちらを参照](https://qiita.com/HeRo/items/7063b86b5e8a2efde0f4)

## 流れ

+ 設定ファイル
	- /etc/nginx/nginx.conf    (nignx 全体の設定)
	- /etc/nginx/conf.d/[app_name].conf    (nginx アプリごとの設定)
	の２つを設定する。
	設定のことをディレクティブと呼ぶ。

+ /etc/nginx/nginx.conf
	- user    worker/cache magaer process の user を指定する。（master は root)
	- worker_processes    ワーカープロセス数。auto でコア数に指定してくれる。<br>
		ex) worker_processes auto<br>
		cf) コア と プロセッサ<br>
			プロセッサ = CPU。CPU の処理を行う部分がコア。cat /proc/cpuinfo や lscpu などで確認できる。

+ /ect/nginx/conf.d/[app_name].conf
- server_name   
	HTTP リクエストのヘッダの、Host フィールドを調べ、一致した場合、そのserver ブロックの設定を使用する。<br>
	※一致しなかった場合、デフォルトのサーバで処理する。
- proxy_pass [転送先アドレス]
- root 
	location 毎にどこを root ディレクトリにするかを指定する。<br>
      cf) ドキュメントルート >> web 上に公開するディレクトリのルート<br>
- include
	他の設定ファイルを読み込んで適用する。
	/etc/nginx/mime.types が書かれることが多い。<br>
	基本的な設定は全て mime.types に書いてあるので、いじる必要はなしっぽい<br>
	[include について](https://heartbeats.jp/hbblog/2012/02/nginx03.html)
	cf) /etc/nginx/mime.types<br>

		types ブロックが記述されているファイル。ファイル名の拡張子から、どの MIMEタイプで情報を返すか、を規定したファイル？<br>
		MIME type >> Content-Type ヘッダと同義？ファイルをどう解釈するかブラウザに教える<br>
- sendfile
	クライアントへのレスポンスに関して、sendfile システムコールを使用しますか？というオプション。<br>
	レスポンスが早くなるが、動作不安定だったりする。普通に運用する分にはONでよい。<br>
	[sedfile について](https://qiita.com/yuse/items/fe05cec1a331306eac19)<br>
	cf) sendfile システムコール<br>
	between ファイルディスクリプタでデータコピーを行う。ファイルを介さずカーネル内で完結するので、read&write より速い。<br>
- tcp_nopush 
	レスポンスヘッダとファイルをセット送るかのオプション。ONにするとまとめて送るのでパケット数が少なくなる。<br>
	普通に運用する分にはONでよさげ。<br>
	[tcp_nopushについてはこちら](https://qiita.com/cubicdaiya/items/235777dc401ec419b14e)<br>
	cf) TCP_CORK ON >> フレーム最大サイズより小さいデータを一定まで送信しませんよ、な設定。
		[tcp_CORK on](https://code-examples.net/ja/q/1519642)<br>
- tcp_nodelay
	デフォでON。明示的に off にすることはほぼないっぽい？<br>
	ソケットに TCP_NODELAY オプションが設定される。あまり小さいパケットを送らないようにするための設定。<br>
	[tcp_nodelay と nginx](https://harukasan.hateblo.jp/entry/2016/01/25/170648)<br>

- keepalive_timeout
	keepalive(tcp通信を切断しないで送受信を行う仕組み)のタイムアウトの時間を設定。<br>
	cf) keepalive  <br>
		js,css,画像など複数のファイルを送受信するので、毎回接続切断すると効率悪くなる。
		[keepalive の設定](https://ex1.m-yabe.com/archives/4305)<br>
	
- types_hash_max_size
	nginx は静的なデータ（サーバ名、ディレクティブ、MIME type、etc..) をすばやく処理するために、ハッシュテーブルを使用する<br>
	[nginx hash 公式](http://nginx.org/en/docs/hash.html)<br>

- client_max_body_size
	リクエストボディサイズの最大値。0に設定すると、無制限となる。デフォで1MB らしい？<br>
	動画や画像のアップロードに対して制限を設けるためのもの？

- location 

- proxy_pass
	アクセスしてきたリクエストを飛ばす先。pumaの場合) " proxy_pass http://puma;"   となる。

- proxy_set_header
	リクエストのヘッダーの要素を書き換える。デフォルトでは以下２つが設定されている。<br>
	- proxy_set_header Host $proxy_host;
	- proxy_set_header Connection close;
	その他の要素など<br>
	+ X-Forwarder-For
		クライントの IPアドレスを追加する設定。XFFヘッダ。<br>
		$proxy_add_x_forwarded_for は $remote_addr が追加されたXFFヘッダ（コンマ区切り）。XFFヘッダがなければ単なる $remote_addr<br>
		[proxy_add_x_forwarded_for](https://nginx.org/en/docs/http/ngx_http_proxy_module.html#var_proxy_add_x_forwarded_for)<br>
		[XFFの流れ](https://christina04.hatenablog.com/entry/2016/10/25/190000)<br>
		cf) $remote_addr<br>
			アクセス元の IPアドレスが保存されている。クライアントからならクライアントIP、LBなら LBIP<br>
	+ Host
		[変数についてはこちらを参照](https://qiita.com/hyakt/items/c0aa8005d9a9700fbe45)<br>
		$host を使った方が安全らしい。ただ、現在のレベルであればあまり気にしなくてよさそう。<br>
		cf) Host リクエストヘッダ<br>
			リクエストを送信する先のサーバーのホスト名 + ポート番号<br>
	+ X-Real-IP
		アプリケーション層用の送信元情報。<br>
		
- proxy_redirect
	レスポンス用の location, refresh ヘッダの書き換え方法を指定する。<br>
	
- location
	server がドメイン名など毎の設定なのに対し、location は URI 毎の設定を記述。<br>
	location / {} だった場合、リクエストURI の先頭が "/" であった場合に適用される。<br>
	Rails では静的ファイル(^~ /assets/ {}) に対して、location での振り分けを設定する。<br>
	^~ は正規表現で、前方一致で一度だけ評価。[locationについて](https://heartbeats.jp/hbblog/2012/04/nginx05.html)

- gzip_static
	gzip on の場合、既に圧縮済みのファイルはそのまま配信する。<br>
	cpu リソースの削減に役立つらしい。静的コンテンツに対しては実施する。<br>

- expires 
	キャッシュの有効期限を設定する HTTPレスポンスヘッダ Expires を記述する。<br>
	max にすると最大。動的コンテンツは cache したらNG。max は 2030年までなので注意.<br>

- add-header
	レスポンスヘッダにフィールドを任意のフィールドを付け加える。<br>
	cf) Cache-Control <br>
		レスポンスとリクエストで働きが異なる。 public はキャッシュOK の値。 <br>










+ nginx -t
設定ファイルにエラーがないかチェックする。


## 仕組み
+ master process
nginx が起動すると、"master process", "worker process", "cache manager process"の３つが、<br>
起動する

+ nginx の役割
リバースプロキシサーバーとして働く。<br>
<クライアント> -(http)-> <nginx> -(socket)-> <puma> -> <rack> -> <ruby>	のようにリクエストは送信される。

+ nignx の特徴
C10K問題に対応するため、コンテキストスイッチが少なくなるように作られ？<br>
cpu リソースが必要な処理（処理に時間がかかる処理）。つまり、「小さなタスクをいっぱいこなす」のが得意っぽい<br>
(だから、リバースプロキシや、静的コンテンツの対応に向いてるのか。)
cf) C10K 問題　>> ハード的には問題なくても、プロセスが多くなってプロセス番号が足りなくなる問題。<br>

## 例
+ ポート80 にて
```
server {
	listen 80; 
	server_name domain1.tld, www.domain1.tld;
	
	location / {
		proxy_pass http://127.0.0.1:3000:
	}
}
```


## 用語
+ モジュール
	以下４種類。ディレクティブの上位のグルーピング。
	- core   
	- event
	- http
	- mail
	重要なのは、http で、ここに server や location を書き込む。

## リンク
+ [Nignx 公式 for beginners](http://nginx.org/en/docs/beginners_guide.html)
	
+ [Nginx が何故ロードバランサとかに向いてるのか](https://www.slideshare.net/yujiotani16/nginx-16850347)
