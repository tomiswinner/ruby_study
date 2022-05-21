import io
import sys

sys.stdin = io.StringIO("3")


n = int(input())

dp = [1]
for i in range(1,n+1):
    dp.append(0)
    if i >= 1:
        dp[i] = dp[i] + dp[i-1]
    if i >= 2:
        dp[i] = dp[i] + dp[i-2]

print(dp[n])


