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
        print(f'piles[i:j]{piles[i:j+1]}')
        print(dp)

sol = Solution()
sol.stoneGame([5,3,4,5])
    

class Solution:
  def stoneGame(self, piles: List[int]) -> bool:
    dp = {}

    def dfs(l, r):
      if l > r:
        return 0
      if (l, r) in dp:
        return dp[(l, r)]
      
      isEven = True if (r-1) % 2 else False
      left = piles[l] if isEven else 0
      right = piles[r] if isEven else 0
      
      dfs(l+1, r)
      dfs(l, r-1)