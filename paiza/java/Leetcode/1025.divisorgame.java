import java.util.Arrays;

class Main{
	public static void main(String[] args){
		Solution sol = new Solution();
		System.out.println(sol.divisorGame(2));
		System.out.println(sol.divisorGame(3));
	}
}

class Solution{
	public boolean divisorGame(int n) {
		boolean dp [] = new boolean[n+1];
		Arrays.fill(dp, false);
		dp[0] = true;
		dp[1] = false;

		for(int i = 2; i < n+1; i++){
			for(int j = 1; j < i; j++){
				// false の場所へ相手を落とし込めるなら勝てる
				if(( i % j == 0 ) && ( dp[i-j] == false )){
					dp[i] = true;
					break;
				}
			}
		}
		// System.out.println(Arrays.toString(dp));
		return dp[n];
	}
}


// n = 1 になったら負け
