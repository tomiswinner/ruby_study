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
    List<Integer> queue = new LinkedList<>();
    while(true){
      Node now = queue.remove(q.size()-1);
      for (int i; i<now.neighbors.size(), i++){
        queue.add(now.neighbors.get(i));
      }


    }

  }
}