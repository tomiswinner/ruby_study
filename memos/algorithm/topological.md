依存関係のあるグラフ（=有向グラフというっぽい)を依存関係通りに処理するのがトポロジカルソート<br>
(依存関係が循環する場合は、トポロジカルソートは成立しません)(有向非巡回グラフ（directed acyclic graph, DAG　と呼ばれる)<br>



k
頂点を考える。辺にはそれぞれ一方通行である。<br>


[初心者向けqiita](https://qiita.com/Morifolium/items/6c8f0a188af2f9620db2)<br>
[こちらのyoutube_はわかりやすいね](https://www.youtube.com/watch?v=ddTC4Zovtbc)<br>
visited set 

stack >> all the childern is visited

stack = topological sort(there can be mutltiple orders)
