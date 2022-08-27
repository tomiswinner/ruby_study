import java.util.*;

class Main{
  public static void main(String[] args){
    Solution sl = new Solution();
    System.out.println(sl.maximum_profit());
  }
}

class Solution{
  public int maximum_profit(){
    Scanner sc = new Scanner(System.in);
    int arr_len = Integer.parseInt(sc.nextLine());

    int maxm = Integer.MIN_VALUE;
    int minv = Integer.parseInt(sc.nextLine());

    for (int i=1; i<arr_len; i++){
        int this_num = Integer.parseInt(sc.nextLine());
        maxm = Math.max(maxm, this_num - minv);
        minv = Math.min(this_num, minv);
    }

    return maxm;
  }
}