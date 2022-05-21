import io
import sys

sys.stdin = io.StringIO("5 100 150")

n, a, b = map(int, input().split())

dp = [0,a]

for i in range(2,n+1):
    dp.append(min(dp[i-1] + a, dp[i-2] + b))

print(dp[n])
    
