# Time limit exceed
# class Solution:
#   def uniquePaths(self, m: int, n: int) -> int:
#     grid = [[0] * m for _ in range(n)]
#     stuck = [[0,0]]
#     cnt = 0
#     while len(stuck) != 0:
#       now_x, now_y = stuck.pop()

#       if now_x == m-1 and now_y == n-1:
#         cnt += 1
#         continue

#       if now_x + 1 < m:
#         stuck.append([now_x+1, now_y])
      
#       if now_y + 1 < n:
#         stuck.append([now_x, now_y+1])
#     return cnt

class Solution():
  def uniquePaths(self, m: int, n: int) -> int:
    grid = [[0] * m for _ in range(n)]
    for i in range(n):
      for j in range(m):   
        if i == 0 or j == 0:
          grid[i][j] = 1
        else:
          grid[i][j] = grid[i-1][j] + grid[i][j-1]
    return grid[n-1][m-1]
        


sol = Solution()
print(sol.uniquePaths(3,7))
      
      