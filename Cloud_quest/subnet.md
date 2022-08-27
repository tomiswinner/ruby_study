## 
vpc はクラスB~D が使用される。<br>
**ルートテーブル**と**NACL**を基準にサブネットを切り分ける<br>
[こちらより抜粋](https://dev.classmethod.jp/articles/vpc-subnet-design/)<br>
サブネットはあくまで、ミスを減らすためのセーフティネットや、区別をしやすくするためのもの<br>
ディレクトリみたいな感じが近いのか？<br>

### サブネット設計のベストプラクティス(一般的な設計)
ネットワーク設計を考える時に、まず一般的なネットワーク設計原則を確認する。例えば、プライベートネットワークにオーバーラップしないようにサブネットを実装するのが良い。また将来への拡大に備えて、IPアドレススペースを余分に確保しておく事も良い考えだ。VPCは、次のような設計のベストプラクティスに従う必要がある。

+ VPCネットワークレンジ（CIDRブロック）が他のプライベートネットワーク範囲とオーバーラップしないようにする<br>
+ 一度に全てのネットワークアドレスを確保してはいけない、将来に使うことも想定して使えるスペースを残しておく<br>
+ 特定のリージョンのすべてのAvailability Zonesに渡って、ネットワークを分ける<br>
+ それぞれのルーティング要件（public subnets vs private subnets）に応じて、サブネットをAvailability Zones毎に作成する<br>
+ 将来予想されるホストマシンの増加に対して備えるために、 VPCのCIDRとサブネットを適切なサイズで用意する<br>

cf) Transit Gateway<br>
VPC とオンプレミスネットワークを相互接続するために使用できるネットワークの中継ハブ<br>




## NACL と セキュリティグループの違いとベストプラクティス
[こちらをどうぞ](https://dev.classmethod.jp/articles/why-i-prefer-sg-to-nacl/)<br>


## NAT gateway
You can use a NAT gateway so that instances in a private subnet can connect to services<br>
outside your VPC but external services cannot initiate a connection with those instances.<br>
？？？そうなん？　VPC外のサービスは接続できないの？<br>
NAT-GW プライベートIP と パブリックIP を n:1 で変換<br>
最初に、アウトバウンドの通信を実施すると、それに応じて NATエントリを生成する<br>
つまり自分から通信を始めない限り、インターネット側から通信ができない、だからプライベートなのね<br>
[こちらのサイトが詳しいです](https://milestone-of-se.nesuke.com/sv-advanced/aws/internet-nat-gateway/)<br>


#### IGW
have two purposes<br>
to provide a target in your VPC route tables for internet-routable traffic.<br>
to perform network address translation(NAT) for instances<br>
static NAT が実施。 プライペートIP とパブリックIP が 1:1 変換される<br>
