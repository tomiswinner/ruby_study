from typing import List

class Solution:
  def stoneGame(self, piles: List[int]) -> bool:
    dp = [[0] * len(piles) for _ in range(len(piles))]

    for i in range(len(piles)):
      dp[i][i] = piles[i]
    
    print(dp)

    for d in range(1, len(piles)):
      for i in range(len(piles)-d):
        j = i + d
        dp[i][j] = max(piles[i] - dp[i+1][j], piles[j] - dp[i][j-1])
        print(f'd:{d},i:{i}, j:{j}')
        print(dp)

sol = Solution()
sol.stoneGame([5,3,4,5])
    