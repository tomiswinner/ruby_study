## 流れ

+ 設定ファイル
	- /etc/nginx/nginx.conf
	- /etc/nginx/conf.d/[app_name].conf
	の２つを設定する。
	設定のことをディレクティブと呼ぶ。

+ /etc/nginx/nginx.conf
	- user    worker/cache magaer process の user を指定する。（master は root)
	- worker_processes    ワーカープロセス数。auto でコア数に指定してくれる。<br>
		ex) worker_processes auto<br>
		cf) コア と プロセッサ<br>
			プロセッサ = CPU。CPU の処理を行う部分がコア。cat /proc/cpuinfo や lscpu などで確認できる。



## 仕組み
+ master process
nginx が起動すると、"master process", "worker process", "cache manager process"の３つが、<br>
起動する

