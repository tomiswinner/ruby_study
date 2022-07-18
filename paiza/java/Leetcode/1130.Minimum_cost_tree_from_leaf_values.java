import java.util.*;

class Main {
  public static void main(String[] args){
    Solution sl = new Solution();
    sl.mctFromLeafValues(new int[] {6, 2, 4});
  }
}

class Solution {
  public int mctFromLeafValues(int[] arr){
    int[][] max = new int[arr.length][arr.length];
    int[][] dp = new int[arr.length][arr.length];

    for (int i=0; i<arr.length; i++){
      max[i][i+1] = Math.max(arr[i], arr[i+1]);
      max[i][i] = arr[i];
      dp[i][i+1] = arr[i] * arr[i+1];
    }
    max[arr.length-1][arr.length-1] = arr[arr.length-1];

    System.out.println("max:");
    System.out.println(Arrays.deepToString(max));
    System.out.println("dp");
    System.out.println(Arrays.deepToString(dp));

    for (int l=2; l<arr.length; l++){
      for (int j=0; j<arr.length-1; j++){
        int pos = j + 1;
        for (int k=j; k<pos; k++){
          int val = max[j][k] * max[k+1][pos] + dp[j][k] + dp[k+1][pos];
          dp[j][pos] = (k == j)? val : Math.min(val, dp[j][pos]);
        }
        max[j][pos] = Math.max(max[j][pos-1], arr[pos]);
      }
    }
    return dp[0][arr.length-1];

  }
}