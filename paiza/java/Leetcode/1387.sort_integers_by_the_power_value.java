import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

class Main{
  public static void main(String[] args){
    Solution sl = new Solution();
    System.out.println(sl.getKth(12,15,2));

  }
}

class Solution{
  public int getKth(int lo, int hi, int k){
    HashMap<Integer, Integer> dp = new HashMap<>();
    dp.put(1, 0);

    for (int i=2; i<=hi; i++){
      int now_int = i;
      int cnt = 0;
      while (true){
        if (now_int % 2 == 0){
          now_int /= 2;
        } else {
          now_int = now_int * 3 + 1;
        }
        cnt += 1;
        
        if (dp.get(now_int) != null){
          dp.put(i, cnt + dp.get(now_int));
          // System.out.printf("dp[i]:%d\n", i);
          // System.out.println(dp.get(i));
          break;
        }
      }
    }
    int[] answers = new int[hi-lo+1];
    for( int i=0; i<answers.length; i++){
      System.out.printf("dp.get(%d)\n",lo+i);
      System.out.printf("dp:%d\n",dp.get(lo+i));
      answers[i] = dp.get(lo+i);
    }
    Arrays.sort(answers);
    return answers[k-1];
  }
}