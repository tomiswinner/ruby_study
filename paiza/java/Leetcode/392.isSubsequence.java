class Main{
  public static void main(String[] args){
    Solution sol = new Solution();
    System.out.println(sol.isSubsequence("abc", "ahbgdc"));
    System.out.println(sol.isSubsequence("axc", "ahbgdc"));
  }
}

class Solution{
  public boolean isSubsequence(String s, String t){
    for(int i=0; i<s.length(); i++){
      boolean boo = false;
      for(int j=0; j<t.length(); j++){
        if(s.charAt(i) == t.charAt(j)){
          boo = true;
          t = t.substring(j+1);
          // System.out.println(t);
          break;
        }
      }
      if(boo == false){
        return false;
      }
    }
    return true;
  }
}