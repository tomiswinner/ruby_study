+ wsl2 をインストール
[こちら](https://chigusa-web.com/blog/wsl2-win11/)<br>

+ Docker Desktop インストール


+ wsl2 が最新じゃないよエラー
![pic1](pic1.png)<br>


でてきたリンクの通り、wsl2 をアップデートすることで解決。<br>


+ Docker Getting Started
[公式の getting started](https://docs.docker.com/get-started/)<br>
チュートリアルに従って進めばOK<br>
[getting started 2](http://localhost/tutorial/)<br>

+ コンテナとは？
a container is simply another process on your machine that has been isolated from all other processes on the host machine　だそう<br>
- コンテナイメージ
ファイルシステムのまるっとコピーを含んでる。これにアプリケーションとかに必要な要素がすべてそろってるんだって。<br>
- Docker Desktop
これ、virtual box と同じで環境管理のためのものか。<br>

+ アプリのビルド
[getting started 3](http://localhost/tutorial/our-application/)<br>
- Dockerfile の作成
アプリディレクトリのルートに、Dockerfile を作成するっぽい?<br>
docker build -t getting-started .  >>> Dockerfile をもとに、コンテナを作成<br>
場所を指定して、どのコンテナを使用するか引っ張って環境を構築するのかな？<br>

+ アプリのアップデート
毎回ビルドして、ポートを設定してサーバーをたてるのかな？<br>
昔のコンテナは docker ps で id 探して、 docker rm [id]　で削除<br>




