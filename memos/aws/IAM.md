# IAM(AWS Identity and Acces Management)

[こちら_security_best_practices_in_IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#create-iam-users) "Require workloads to user temporary credentials with IAM roles to access AWS " のくだり。<br>

+ human identities = 管理者、開発者、使用者など、現実世界で、ワークロードを使用する方々の区分<br>
+ workforce identities = <br>
+ workload = 何かビジネスなどの機能を実現するのに必要なコード、インフラ機能すべて<br>
+ machine identities = AWS のリソースにアクセスするマシン毎の権限,<br>
+ federated >> 二つの組織が一つになったイメージかな<br>


### IAM tutorial
個々のアカウントを持つんじゃなくて、アクセス可能な範囲を決めたIAMアカウントをそれぞれ共有する<br>
管理者は、本番環境・開発環境どちらもアクセスできる、開発者は、開発環境しかできないってな感じ<br>
ぶっちゃけ個人で使う分には IAM 使わなくていいんじゃねーかなー<br>
-> 一応ルートユーザーだと権限が多すぎて、セキュリティ的に危険なので、って話はあるので、個人利用でも IAM 推奨っぽい、でもぶっちゃけめんどうくさい<br>

### だめだよちゃんとIAM しないと！
やっぱだめらしい<br>
[こちらのawsアカウントを作ったらやること！に従ってやろうとりあえず](https://qiita.com/tmknom/items/303db2d1d928db720888)<br>
#### MFA(Multi-Factor Authentication) = 多要素認証　まず、これ設定しないとらしい
+ 仮想MFA => アプリを利用しての認証。Microsoft Authenticator をイメージ<br>
Microsoft Authencicator + aws の組み合わせについては、[こちら](https://qiita.com/Catetin0310/items/b91ea87f0ac8ea2f6b2b)<br>
