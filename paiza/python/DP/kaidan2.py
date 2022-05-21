import io
import sys

sys.stdin = io.StringIO("11 3 4")

n, a, b = map(int, input().split())

dp = [1]

for i in range(1, n+1):
    dp.append(0)
    if i >= a:
        dp[i] = dp[i] + dp[i-a]
    if i >= b:
        dp[i] = dp[i] + dp[i-b]

print(dp[n])

