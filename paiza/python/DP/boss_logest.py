import io
import sys

sys.stdin = io.StringIO("5\n187\n192\n115\n108\n109")

n = int(input())

heights = []
for _ in range(n):
    heights.append(int(input()))

dp = [1] * n

for i in range(1, n):
    if heights[i] <= heights[i-1]:
        dp[i] = dp[i-1] + 1
    else:
        dp[i] = 1
        
print(max(dp))
