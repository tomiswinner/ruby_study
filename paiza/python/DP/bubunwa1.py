import io
import sys

sys.stdin = io.StringIO("5 19\n7\n18\n5\n4\n8")

n, x = map(int, input().split())

arr = [int(input()) for _ in range(n)]

dp = [[False] * (x + 1) for _ in range(n)] 

# 1つめのおもりで作れる重さ
dp[0][0] = True
if arr[0] <= x:
  dp[0][arr[0]] = True


for i in range(1, n):
  for j in range(x+1):
    if dp[i-1][j] == True:
      dp[i][j] = True
    # out of index 対策
    if j < arr[i]:
      continue

    if dp[i-1][j-arr[i]] == True: 
      dp[i][j] = True

if dp[n-1][x] == True:
  print('yes')
else:
  print('no')