#### scan と query とキャパシティ
+ scan -> 全権走査<br>
+ query -> where 句見たいん感じ、条件指定走査<br>
+ キャパシティ -> 時間単位でのデータを読み込みできる量、書き込みできる量。DynamoDB はこれで制限がかかってる。そのため、scan とかはキャパシティを食いつぶすので要注意<br>