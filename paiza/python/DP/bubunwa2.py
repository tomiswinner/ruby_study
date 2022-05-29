import io
import sys
sys.stdin = io.StringIO("5 10\n7\n3\n4\n3\n2")

n, x = map(int, input().split())

arr = [int(input()) for _ in range(n)]

dp = [[0] * (x+1) for _ in range(n)]

dp[0][0] = 1
if arr[0] <= x:
  dp[0][arr[0]] = 1

for i in range(n):
  for j in range(x+1):
    if dp[i-1][j] != 0:
      dp[i][j] += dp[i-1][j]

    if arr[i] > j:
      continue
    
    if dp[i-1][j-arr[i]] != 0:
      dp[i][j] += dp[i-1][j-arr[i]] 

if n == 1:
  print(0)
else:
  print(dp[n-1][x] %  1000000007)

