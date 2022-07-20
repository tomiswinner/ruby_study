import java.util.*;

class Main{
  public static void main(String[] args){
    Solution sl = new Solution();
    System.out.println(Arrays.toString(sl.productExceptSelf(new int[] {1, 2, 3, 4})));
    System.out.println(Arrays.toString(sl.productExceptSelf(new int[] {-1,1,0,-3,3})));
  }
}

class Solution{
  public int[] productExceptSelf(int[] nums){
    int[] left = new int[nums.length];
    int[] right = new int[nums.length];
    int[] ans = new int[nums.length];
    left[0] = nums[0];
    right[nums.length-1] = nums[nums.length-1];
    
    for (int i=1; i<nums.length; i++){
      left[i] = left[i-1] * nums[i];
    }
    for (int i=nums.length-2; i>=0; i--){
      right[i] = right[i+1] * nums[i];
    }

    for (int i=0; i<nums.length; i++){
      if (i == 0){
        ans[i] = right[i+1];
        continue;
      }
      if (i == nums.length-1){
        ans[i] = left[i-1];
        continue;
      }
      ans[i] = left[i-1] * right[i+1];
    }
    
    return ans;
  }
}