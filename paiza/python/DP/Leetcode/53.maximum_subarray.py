from typing import List

class Solution:
  def maxSubArray(self, nums: List[int]) -> int:
    dp = [0] * (len(nums))
    dp[0] = nums[0]

    for i in range(1,len(nums)):
      dp[i] = max(nums[i], dp[i-1] + nums[i])

    return max(dp)


sol = Solution()
print(sol.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))

print(sol.maxSubArray([-1]))

print(sol.maxSubArray([-2,1]))
