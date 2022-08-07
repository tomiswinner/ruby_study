class Main{
  public static void main(String[] args){

  }
}

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

  public Node(int _val, ArrayList<Node> neighbors){
    val = _val;
    neighbors = _neighbors;
  }
}


class Solution{
  public Node cloneGraph(Node node){
    List<Node> queue = new LinkedList<>();
    queue.add(node);
    Map<Node, Node> mp = new HashMap<>();
    while(true){
      Node now = queue.remove(q.size()-1);
      for (int i; i<now.neighbors.size(), i++){
        // 次に訪れるノードを記憶
        if (!mp.containsKey(now.neighbors.get(i))){
          queue.add(now.neighbors.get(i));
        }
      }
      Node cp_now = new Node(now.val)
      // 循環するから終わらないじゃん。だから map とかにしてたんだ。考え直し！

    }

  }
}