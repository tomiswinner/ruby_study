from typing import List

class Solution:
   def generate(self, numRows: int) -> List[List[int]]:
       dp = [[1]]
       for i in range(1,numRows):
           dp.append([])
           for j in range(i+1):
               dp[i].append(0)
               if j-1 < 0:
                   dp[i][j] = dp[i-1][j]
               elif j >= i:
                   dp[i][j] = dp[i-1][j-1]
               else:
                   dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
       return dp

sol = Solution()

print(sol.generate(5))
