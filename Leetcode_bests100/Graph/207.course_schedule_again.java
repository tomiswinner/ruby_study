class Main{
	public static void main(String[] args){

	}
}

class Solution{
	public boolean canFinish(int numCourse, int[][] prerequisites){
		Set<Integer> visited = new HashSet<>();
		Map<Integer, ArrayList<Integer>> mp = new HashMap<>();
		for (int i=0; i<numCourse; i++){
			mp.put(i, new ArrayList<Integer>());
		}
		for (int[] reqs : prerequisites){
			mp.get(reqs[0]).add(reqs[1]);
		}

		for (int i=0; i<numCourse; i++){
			if (!dfs(i, mp, visited)) return false;
		}

		return true;

	}

	private boolean dfs(int course, Map<Integer, ArrayList<Integer>> mp, Set visited){
		if (mp.get(course).isEmpty()){
			return true;
		}

		if (visited.contains(course)){
			return false;
		}

		visited.add(course);
		for (int req : mp.get(course)){
				if (!dfs(req, mp, visited))	return false;
		}
		// false の場合、その時点で結果が決まるので visited から remove する必要がそもそもないのか。
		visited.remove(course);

		mp.get(course).clear();
		
		return true;
	}
}
