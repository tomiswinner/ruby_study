import java.util.*;

class Main{
	public static void main(String[] args){
		Solution sr = new Solution();
		System.out.println(sr.maxSubArray(new int[] {-2,1,-3,4,-1,2,1,-5,4}));
		System.out.println(sr.maxSubArray(new int[] {1}));
		System.out.println(sr.maxSubArray(new int[] {5,4,-1,7,8}));
	}
}

class Solution{
	public int maxSubArray(int[] nums){
		int[] dp = Arrays.copyOf(nums, nums.length);
		for (int i=1; i<nums.length; i++){
			dp[i] = Math.max(dp[i-1] + nums[i], dp[i]);
		}
		return Arrays.stream(dp).max().getAsInt();
	}
}
