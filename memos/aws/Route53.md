+ HTTPSかについては[こちら](https://dev.classmethod.jp/articles/aws-web-server-https-for-beginner/#pl1)

+ Aレコード(Address)
ドメイン <-> IPアドレス　の変換を行うノーマルなレコード。<br>
hoopes においては、ELB のDNS名が登録されている<br>


cf) CNAMEレコード(Canonical NAME)
Aレコードで定義されている関係にさらに別名をつける<br>
つまり、ドメイン <-> 別ドメインのレコード<br>
hoopers では、ACM から何らかの操作をして、CNAME を登録してるっぽいな<br>
>ACM の検証用,ACMが証明書の更新をこのCNAMEレコードを入れておくとやってくれるらしい<br>


+ NSレコード(Name Server)
権威サーバーがどこかを記述するレコード(=どこに実際のDNSレコードがあるか)<br>
SOAとNSレコードは自動で基本的に作成されるため、あまりこちらで管理する必要はないそうです。<br>
+ SOAレコード(Start of Authority)
ドメインまたはゾーンに関する重要な情報をもつ。<br>
(管理者のemail, ドメインが最後に更新された時間, サーバーが更新の間に待つ時間など)<br>
要はメタ情報かな？<br>

+ ゾーン(zone)
a zone is a space which administrative responsibilitiy is delegated to one manager.
A zone might include these things.
- One domain name
- One domain name and several subdomains
- Multiple domain names


