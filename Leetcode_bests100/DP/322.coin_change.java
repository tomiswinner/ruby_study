class Main{
  public static void main(String[] args){
    Solution sl = new Solution();
    System.out.println(sl.coinChange(new int[] {1,2,5}, 11));
    System.out.println(sl.coinChange(new int[] {2}, 3));
    System.out.println(sl.coinChange(new int[] {1}, 0));


  }
}

class Solution{
  public int coinChange(int[] coins, int amount){
    int[] dp = new int[amount+1];
    for (int i=0; i<dp.length; i++){
      dp[i] = Integer.MAX_VALUE-1;
    }
    dp[0] = 0;

    for (int i=1; i<amount+1; i++){
      for (int j=0; j<coins.length; j++){
        if (coins[j] > i){
          continue;
        }
        dp[i] = Math.min(dp[i], dp[i-coins[j]]+1);
      }
    }

    if (dp[dp.length-1] == Integer.MAX_VALUE-1){
      return -1;
    }

    return dp[dp.length-1];
  }
}