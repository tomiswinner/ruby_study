class Main{
 public static void main(String[] args){

 } 
}

class Solution{
  public int twoEggDrop(int n){
  }
  
  private int eggDrop(int floors, int eggs, int[][] dp){
    if( floors<=2 || eggs==1 ){
      return floors;
    }   
    if( dp[floors][eggs] != 0 ){
      return dp[floors][eggs];
    }
    
    int min = floors;
    for( int i=1; i<floors; i++){
      int brokenEggs = 1 + eggDrop(i-1, eggs-1, dp);
      System.out.println(brokenEggs):
      int noBrokenEggs  = 1 + eggDrop(floors-i, eggs, dp);
      System.out.println(noBrokenEggs):
      int tries = Math.max(brokenEggs, noBrokenEggs);
      System.out.println(tries):
      min = Math.min(min, tries)
    }
    // 代入かつ、代入された数字が return 
    return dp[floors][eggs] = min;
  }
}

// 1~n
// 0 <= f <= n
// higher than f = break

// 最初の１つは壊れるまで、半分のところで落とす
// ex) 1~10 5で落とし、割れなければ 5~10 8で落とす
// ひとつ割れたら、割れた n ~ m の n から順に落としていく
// 
// 1~n で n/2 のところで落とす。
// if 壊れる == true >> for 1~n/2
// if 壊れない　>> n/2 ~ n で落とす
// 

// 違うわ、２個しかないから、
// n を