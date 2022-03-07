- ++capistrano
  docs
  github公式
  
  
	- staging
	  環境を変数として定義できる。
	  production として定義すれば、その環境設定をすぐにロードできる。
	  
	  
	- ++capfile
	  capfile は設定をするためのテンプレートを作成してくれる。
	  deploy.rb と stage file を編集する必要がある。
	  
	  
	- アプリの準備
	  github などに準備しておくこと。
	  >>cap install で capfile を生成
	  capfile は rails(rake) に含まれる。 ※ rake = rails の昔
	  
	  capistrano は 3つの role という概念をもつ
	  >>web  app  db  である


    