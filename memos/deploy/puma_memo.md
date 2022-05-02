
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





