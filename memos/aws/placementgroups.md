#### placement group が早い理由
[こちらのサイトが詳しい,抜粋]()<br>
When you launch a new EC2 instance, the EC2 service attempts to place the instance in such a way that all of your instances are spread out across underlying hardware to minimize correlated failures.<br>
You can use placement groups to influence the placement of a group of interdependent instances to meet the needs of your workload. Depending on the type of workload.<br>
普通にEC2を作成すると、AZ内で分散配置するように起動する（可用性のため)<br>
プレースメントグループを利用すると、物理的に近接するようにEC2を起動してくれる。だから低レイテンシ・高スループット<br>