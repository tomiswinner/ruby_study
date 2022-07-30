#### **/etc/hosts はもう使われてない？**
DNS が基本的に使われるので、メインではない、補助的に使われている<br>

#### /etc/rosolv.conf の search と domain について
/etc/resolv.conf はリゾルバ（自身の OS が DNS 問い合わせを行う際に使用する DNSクライアント のプログラムみたいなイメージ)を設定するファイル。<br>
+ search と domain の違いとは？<br>
domain は一つしか指定できない（自分のマシンが属するドメイン）、serach は検索用、複数指定OK<br>
search は、 search addr1 addr2 addr3 と記入し、"yahoo" ドメインの検索を行う場合、<br>
"yahoo.addr1", "yahoo.addr2", "yahoo.addr3" と順に検索する<br>

#### /etc/nsswitch.conf
名前解決の全ての優先順位を管理するファイル、[一番わかりやすいのはこれかな](https://linuc.org/study/knowledge/508/)<br>
hosts: files dns => files[ローカルファイル], dns の順に名前解決を実行する<br>

