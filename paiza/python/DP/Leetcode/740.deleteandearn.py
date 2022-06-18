from typing import List

class Solution:
    def deleteAndEarn(self, nums: List[int]) -> int:
        dp [0 for _ in range(10**4+1)]
        dp[0] = 1 * nums.count(1)

        for i in range(1,10**4+1):
            dp[i] = (i+1) * nums.count(i+1)
            


            


sol = Solution()
sol.deleteAndEarn([3,4,2])
sol.deleteAndEarn([2,2,3,3,4])

        
