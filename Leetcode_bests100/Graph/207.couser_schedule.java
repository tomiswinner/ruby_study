import java.util.*;

class Main{
	public static void main(String[] args){
		Solution sl = new Solution();
		// System.out.println(sl.canFinish(2, new int[][] {{1,0}}));
		System.out.println(sl.canFinish(4, new int[][] {{1,2},{2,3},{3,1}}));
	}
}

class Solution{
	public boolean canFinish(int numCourses, int[][] prerequisites){
		Set<Integer> visited = new HashSet<>();
		Map<Integer, ArrayList<Integer>> preMap = new HashMap<>();
		for (int i=0; i<numCourses; i++){
			preMap.put(i,new ArrayList<Integer>(Arrays.asList()));
		}
		for (int[] prereq: prerequisites){
				preMap.get(prereq[0]).add(prereq[1]);
		}
		
		for (int i=0; i<numCourses; i++){
			if (!dfs(i, visited, preMap)) return false;
		}
		return true;
	}

	private boolean dfs(int course, Set visited, Map<Integer, ArrayList<Integer>> preMap){
		if (visited.contains(course)){
			// ２回訪れる = ループ
			return false;
		}
		if (preMap.get(course).isEmpty()){
			// 訪れた場所の先に依存関係がない
			return true;
		}

		visited.add(course);
		for (Integer pre : preMap.get(course)){
			if (!dfs(pre, visited, preMap)) return false;
		}

		// remove しないと別のコースからスタートしたときにおかしくなっちゃう！
		visited.remove(course);
		// このノードに関してはループがなかったですよ。なので、依存関係を排除します！
		preMap.get(course).clear();

		return true;
	}
}