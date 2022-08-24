#### NAT gateway
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
