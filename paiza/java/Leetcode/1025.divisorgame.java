class Solution{
  public boolean divisorGame(int n) {
    boolean dp[];
    dp = [False] * n
    dp[0],dp[1] = true, false

    for(int i = 2; i < n; i++){
      for(int j = 1: j < i; j++){
        // false の場所へ相手を落とし込めるなら勝てる
        if( i % j == 0 ) && ( dp[i-j] == false ){
          dp[i] = true;
          break;
        }
      }
    }
  }
}

// n = 1 になったら負け