import io
import sys

sys.stdin = io.StringIO("4 110 200")

n, a, b = map(int, input().split())

dp = [1000000] * (n+5)

dp[0] = 0

for i in range(1,n+5):
    if i >= 2:
        dp[i] = min(dp[i], dp[i-2] + a)
    if i >= 5:
        dp[i] = min(dp[i], dp[i-5] + b)

print(min(dp[n:]))

