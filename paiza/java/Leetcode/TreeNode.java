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
