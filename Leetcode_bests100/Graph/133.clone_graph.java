import java.util.*;

class Node{
  public int val;
  public List<Node> neighbors;

  public Node(){
    val = 0;
    neighbors = new ArrayList<Node>();
  }
  public Node(int _val){
    val = _val;
    neighbors = new ArrayList<Node>();
  }
  public Node(int _val, ArrayList<Node> _neighbors){
    val = _val;
    neighbors = _neighbors;
  }
}

class Solution{
  public void dfs(Map<Node, Node> map, Node cur){
    // 現在訪れているノードのお隣さんたち
    List<Node> nei = cur.neighbors;

    // 現在地ノードのお隣さんを調べていく
    for (Node n : nei){
      if (!map.containsKey(n)){
        // map に含まれていない = そのノードを訪れていない(= 親ノードとして見ていない)場合、
        // 今回、n のノード構造を map へ書く(deep copy)
        // ノードの隣接は、実際に n を訪れた際に、add することになる
        map.put(n, new Node(n.val, new ArrayList<>()));
        dfs(map, n);
      }

      // 現在地のノードを取り出して、n を追加
      map.get(cur).neighbors.add(map.get(n));
    }
  }

  public Node cloneGraph(Node node){
    if (node == null) return null;

    // hashmap に、隣接するノードをそれぞれ記憶していく
    Map<Node, Node> map = new HashMap<>();
    map.put(node, new Node(node.val, new ArrayList<>()));

    dfs(map, node);
    
    return map.get(node);
  }
}
