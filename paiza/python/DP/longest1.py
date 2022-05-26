import io
import sys

sys.stdin = io.StringIO("5\n160\n178\n170\n190\n190")

n = int(input())

arr = [int(input()) for x in range(n)]

dp = [1]

for i in range(1,n):
  dp.append(0)
  if arr[i-1] <= arr[i]:
    dp[i] = dp[i-1] + 1
  else:
    dp[i] = 1

print(max(dp))
