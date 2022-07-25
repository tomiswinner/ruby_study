import java.util.*;

class Main{
	public static void main(String[] args){
		Solution sl = new Solution();
		System.out.println(sl.maxProduct(new int[] {2,3,-2,4}));
		System.out.println(sl.maxProduct(new int[] {-2,0,-1}));
		System.out.println(sl.maxProduct(new int[] {-2, 3, -4}));
		System.out.println(sl.maxProduct(new int[] {-2}));
	}
}

class Solution{
	public int maxProduct(int[] nums){
		int[][] dp = new int[2][nums.length];
		dp[0][0] = nums[0];
		dp[1][0] = nums[0];

		for (int i=1; i<nums.length; i++){
			dp[0][i] = Math.max(Math.max(dp[0][i-1] * nums[i], dp[1][i-1] * nums[i]), nums[i]);
			dp[1][i] = Math.min(Math.min(dp[0][i-1] * nums[i], dp[1][i-1] * nums[i]), nums[i]);
		}
		// System.out.println(Arrays.toString(dp[0]));
		// System.out.println(Arrays.toString(dp[1]));
		return Math.max(Arrays.stream(dp[0]).max().getAsInt(), Arrays.stream(dp[1]).max().getAsInt());
	}
}
