import io
import sys

sys.stdin = io.StringIO("4 2 110 5 200")

n, x, a, y, b = map(int, input().split())

dp = [float('inf')] * (n+y)

dp[0] = 0

for i in range(x,n+y):
    if i >= x:
       dp[i] =  min(dp[i], dp[i-x] + a)
    if i >= y:
       dp[i] =  min(dp[i], dp[i-y] + b)
print(min(dp[n:]))
