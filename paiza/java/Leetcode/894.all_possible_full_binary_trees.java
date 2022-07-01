import java.util.*;

class Main{
	public static void main(String[] args){
		Solution sl = new Solution();
		System.out.println(sl.allPossibleFBT(7));
	}
}

class Solution {
	public List<TreeNode> allPossibleFBT(int n){
		List<TreeNode> rst = new ArrayList<>();
		if(n==1){
			rst.add(new TreeNode(0));
		}
		n -= 1;
		for(int i=1; i<=n; i+=2){
			List<TreeNode> left = allPossibleFBT(i);
			List<TreeNode> right = allPossibleFBT(n-i);

			for(TreeNode l: left){
				for(TreeNode r: right){
					TreeNode root = new TreeNode(0);
					root.left = l;
					root.right = r;
					rst.add(root);
					System.out.printf("rst: %c", rst.toString());
				}
			}
		}
		return rst;
	}
}

public class TreeNode {                                                         
		int val;
		TreeNode left;
		TreeNode right;
				// ↓の空のコンストラクタは引数なしでもクラスを定義できるようにするためのもの
		 TreeNode(){}
		 TreeNode(int val){
			 this.val = val;
		 }
		 TreeNode(int val, TreeNode left, TreeNode right){
			 this.val = val;
			 this.left = left;
			 this.right = right;
		 }
 }
