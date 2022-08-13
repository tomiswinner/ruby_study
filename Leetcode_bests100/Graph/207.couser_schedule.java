import java.util.*;

class Main{
	public static void main(String[] args){
		Solution sl = new Solution();
		// System.out.println(sl.canFinish(2, new int[][] {{1,0}}));
		System.out.println(sl.canFinish(4, new int[][] {{2,0},{0,2}}));
	}
}

class Solution{
	public boolean canFinish(int numCourses, int[][] prerequisites){
		int[][] matrix = new int[numCourses][numCourses];
		int[] indegree = new int[numCourses];
		// indegree(次数)　接するノードの数のことらしい

		for (int i=0; i<prerequisites.length; i++){
			int ready = prerequisites[i][0];
			int pre = prerequisites[i][1];
			if (matrix[pre][ready] == 0){
				// ready に関して制約があれば、indegree が加算されていく
				indegree[ready]++;
			}
			matrix[pre][ready] = 1;
		}

		int count = 0;
		Queue<Integer> queue = new LinkedList<>();
		for (int i=0; i<indegree.length; i++){
			// 制約がないものを queue に突っ込む
			if (indegree[i] == 0) queue.offer(i);
		}

		System.out.println(Arrays.toString(indegree));
		System.out.println(Arrays.deepToString(matrix));
		while (!queue.isEmpty()){
			int course = queue.poll();
			count++;
			for (int i=0; i<numCourses; i++){
				// course を通るために必要な i があるか？
				if (matrix[course][i] != 0){
					// 制約があるなら、indegree を減らす。それが 0 なら queue に追加。
					if (--indegree[i] == 0){
						System.out.printf("i:%d\n",i);
						queue.offer(i);
					}
				}
			}
		}
		return count == numCourses;
	}
}
