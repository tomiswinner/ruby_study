import io
import sys

sys.stdin = io.StringIO("9 2 100 3 125 5 200")

n, x, a, y, b, z, c = map(int, input().split())

dp = [float('inf')] * (n+z)
dp[0] = 0

for i in range(x, n+z):
    if i >= x:
        dp[i] = min(dp[i], dp[i-x]+a)
    if i >= y:
        dp[i] = min(dp[i], dp[i-y]+b)
    if i >= z:
        dp[i] = min(dp[i], dp[i-z]+c)

print(min(dp[n:]))
