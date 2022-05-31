class Solution:
  def climbStairs(self, n: int) -> int:
    dp = [1,2]
    for i in range(2,n):
      dp.append(0)
      dp[i] = dp[i-1] + dp[i-2]
    return dp[n-1]

sol = Solution()
sol.climbStairs(3)