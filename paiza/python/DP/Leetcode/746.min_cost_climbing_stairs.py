from typing import List

class Solution:
  def minCostClimbingStairs(self, cost: List[int]) -> int:
    cost.append(0)
    
    dp = [0] * len(cost)
    dp[len(cost)-1] = 0
    dp[len(cost)-2] = cost[-2]

    for i in range(len(cost)-3, -1, -1):
      dp[i] = min(dp[i+1], dp[i+2]) + cost[i]
    
    return min(dp[0], dp[1])


  

sol = Solution()
print(sol.minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1]))
print(sol.minCostClimbingStairs([10,15,20]))
      
      