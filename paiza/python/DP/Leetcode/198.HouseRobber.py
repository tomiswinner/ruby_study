from typing import List
class Solution:
    def rob(self, nums: List[int]) -> int:
        dp = [0, nums[0]]
        for i in range(1, len(nums)):
            dp.append(max(dp[i-1] + nums[i], dp[i]))
        return dp[-1]

sol = Solution()

print(sol.rob([1,2,3,1]))

print(sol.rob([2,7,9,3,1]))

print(sol.rob([0]))
