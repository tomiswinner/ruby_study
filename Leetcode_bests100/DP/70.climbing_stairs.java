class Main{
  public static void main(String[] args){
    Solution sl = new Solution();
    System.out.println(sl.climbStairs(2));
    System.out.println(sl.climbStairs(3));


  }
}

class Solution{
  public int climbStairs(int n){
    if (n==1){
      return 1;
    }
    int[] dp = new int[n];
    dp[0] = 1;
    dp[1] = 2;
    for (int i=2; i<n; i++){
      dp[i] = dp[i-1] + dp[i-2];
    }
    return dp[dp.length-1];
  }
}