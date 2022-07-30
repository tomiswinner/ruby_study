#### **route, netstat -r の Gateway のアスタリスクはなに？**
[こちらを参照してほしいです！](https://ips.nekotype.com/1602/)<br>
Gateway の * は、同じ LAN に所属しているので、ルーターを経由しないでハブなどでアクセスできるよ！ってことらしい？<br>

#### **ip, ifconfig の見方**
[こちらを参照](https://qiita.com/pe-ta/items/aff8db72530c6baa11b2)<br>
ちなみに、ifconfig は deprecated となったので、正式には ip の使用が推奨<br>
+ cf) [ルーティングテーブルの見方](https://qiita.com/cafedrip/items/8f0cc9544910cba23be8)<br>
0.0.0.0 が全てのアドレスにマッチするのは、ルーティングは n.n.n.n ~ 255.255.255.255 にマッチする仕様だから<br>
複数行にマッチする場合、ロンゲストマッチ（n.n.n.n/xx の xx にあたるサブネットマスクlength が長い方）を適応する<br>
+ ip -s link => link はデータリンク層のこと, -s は statics (統計情報)p<br>


#### CIDR(Classless InterDomain Routing) と クラスフル
クラスフル（クラスA~E)の方式は IPアドレスの無駄が多すぎるので使われていない<br>
CIDR が基本、そこ認識できてなかった。<br>