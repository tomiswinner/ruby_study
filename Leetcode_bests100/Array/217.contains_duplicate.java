import java.util.*;

class Main{
  public static void main(String[] args){
    Solution sl = new Solution();
    System.out.println(sl.containsDuplicate(new int[] {1,2,3,1}));
    System.out.println(sl.containsDuplicate(new int[] {1,2,3,4}));
    System.out.println(sl.containsDuplicate(new int[] {1,1,1,3,3,4,3,2,4,2}));
  }
}

class Solution{
  public boolean containsDuplicate(int[] nums){
    Set<Integer> set = new HashSet<Integer>();
    for (int i=0; i<nums.length; i++){
      if (!set.add(nums[i])){
        return true;
      }
    }
    return false;
  }

}