
+ worker 
スクリプトの処理をメインとは別のスレッドに移して対応してくれる。<br>
ex)あるWordPressサイト向けに2つのワーカープロセスが利用でき、 ページキャッシュの設定がされていないとします。4つのリクエストがまったく同時にサイトに到着した場合、それらのうち2つはすぐに処理されますが、他の2つは最初の2つが処理を完了するまでキューで待機する必要があります。<br>

cf)serivice worker
>> web worker の派生(進化版?)

worker 1つにつき、n threads もつ。

workersはCPUコア数よりも少なく設定するのが推奨。(公式)
Use cluster mode and set the number of workers to 1.5x the number of CPU cores in the machine, starting from a minimum of 2

threadsはデフォルトの5が推奨（以下、公式サイトより）
•	Set the number of threads to desired concurrent requests/number of workers. Puma defaults to 5, and that's a decent number.

処理できるリクエストは,worker × threads できまる。

[https://study-infra.com/rails-puma/#toc4](詳細)<br>


+ クラスターモード
マルチプロセス&マルチスレッドな状態のこと。
n worker × n threads でリクエストを処理する

+ MRI
>>Cruby と呼ばれる、ruby の C言語で実装された部分。
Global Interpreter Lock なる仕組みがある。
- GLI(global interpreter lockl)
「複数スレッド下でもロックを持つ単一スレッドでしかバイトコードが実行できず、その他のスレッドは待機状態になる」
ひとまずCPUバウンドな処理は一スレッドでしか実行できず、処理の並列化が制限されると認識しておけば良いでしょう。<br>
この仕組みの為、必ずしもプロセスにつき、nスレッドが使えるわけではない。

+ config/puma.rb
- bind
	使用するソケットをURIにて指定する？<br>
	デフォは TCP で、 " bind 'tcp://0.0.0.0:9292' "<br>
- worker
	ワーカー数を指定、デフォ0。master プロセスから fork して生成。<br>

- threads
	worker 内のスレッドの数。min, max で指定する。<br>
	(トラフィックに応じて、自動で増減させてくれるため) デフォは 0,16 <br>

- environment
	環境を指定する。デフォは "development" <br>
	rails では、環境変数 RAILS_ENV に格納されているものを使用するのがよい。<br>
	ex) environment ENV.fetch("RAILS_ENV")

- demonize
	デフォ false。デーモン化

- pidfile
	pid ファイルの置き場をパスで指定する。<br>
	/tmp/pids/puma.pid がよい。（普通に起動するとここ）<br>
	cf) pid ファイル<br>
	プロセスIDが記述されているので、プロセスの制御などに使われる。<br>

- stdout_redirect
	標準出力/標準エラー出力先のファイルのパスを指定。<br>
	ex) stdout_redirect '/u/apps/lolca/log/stdout', '/u/apps/lolcat/log/stderr"<br>

