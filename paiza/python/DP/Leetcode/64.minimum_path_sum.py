from typing import List

class Solution:
  def minPathSum(self, grid: List[List[int]]) -> int:
    m = len(grid)
    n = len(grid[0])
    
    for i in range(1,m):
      grid[i][0] += grid[i-1][0]

    for i in range(1,n):
      grid[0][i] += grid[0][i-1]

    for i in range(1,m):
      for j in range(1,n):
       grid[i][j] += min(grid[i-1][j], grid[i][j-1])

    return grid[-1][-1]
        
sol = Solution()
print(sol.minPathSum( [[1,3,1],[1,5,1],[4,2,1]]))
print(sol.minPathSum([[1,2,3],[4,5,6]]))


# 右か左以外に行くのは最短じゃないか。

