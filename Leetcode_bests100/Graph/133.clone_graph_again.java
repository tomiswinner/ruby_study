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
		
		if (node == null) return null;


    List<Node> queue = new LinkedList<>();
    queue.add(node);
    Map<Node, Node> mp = new HashMap<>();
		mp.put(node, new Node(node.val, new ArrayList<>()));

    while(true){
      Node now = queue.remove(queue.size()-1);
      for (int i=0; i<now.neighbors.size(); i++){
        // 次に訪れるノードを記憶&&次に訪れるノードを生成して mapへ追加
				Node n = now.neighbors.get(i);
        if (!mp.containsKey(n)){
					mp.put(n, new Node(n.val, new ArrayList<>()));
          queue.add(n);
        }
				mp.get(now).neighbors.add(mp.get(n));
      }
			if (queue.size() == 0){
				break;
			}
    }
		return mp.get(node);

  }
}
