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
- proxy_pass [転送先アドレス]


+ nginx -t
設定ファイルにエラーがないかチェックする。


## 仕組み
+ master process
nginx が起動すると、"master process", "worker process", "cache manager process"の３つが、<br>
起動する

+ nginx の役割
リバースプロキシサーバーとして働く。<br>
<クライアント> -(http)-> <nginx> -(socket)-> <puma> -> <rack> -> <ruby>	のようにリクエストは送信される。



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



## リンク
+ [Nignx 公式 for beginners](http://nginx.org/en/docs/beginners_guide.html)
	
+ 
