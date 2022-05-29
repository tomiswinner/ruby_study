import io
import sys

sys.stdin = io.StringIO("7 22\n71\n57\n1\n78\n93\n12\n56")

n, x = map(int, input().split())

arr = [int(input()) for _ in range(n)]

dp = [[float('inf')] * (x+1) for _ in range(n)]

dp[0][0] = 0
if arr[0] <= x:
  dp[0][arr[0]] = 1

for i in range(1,n):
  for j in range(x+1):

    if dp[i-1][j] != float('inf'):
      dp[i][j] = min(dp[i][j],dp[i-1][j])
    
    if arr[i] > j:
      continue
    
    if dp[i-1][j-arr[i]] != float('inf'):
      dp[i][j] = min(dp[i][j], dp[i-1][j-arr[i]] + 1)

if dp[n-1][x] == float('inf'):
  print(-1)
else:
  print(dp[n-1][x])


