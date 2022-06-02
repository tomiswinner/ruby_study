from typing import List

class Solution:
  def maxProfit(self, prices: List[int]) -> int:
    dp = [0] * len(prices)
    for i in range(len(prices)-1):
      dp[i] = max(dp[i], max(prices[i+1:]) - prices[i])
    return max(dp)

sol = Solution()
print(sol.maxProfit([7,1,5,3,6,4]))
print(sol.maxProfit( [7,6,4,3,1]))
print(sol.maxProfit([1]))