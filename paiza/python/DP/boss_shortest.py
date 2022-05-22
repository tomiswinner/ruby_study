import io
import sys

sys.stdin = io.StringIO("5\n109\n110\n108\n103\n100")

n = int(input())

arr = [int(input()) for i in range(n)]

dp = []

for i in range(n):
    dp.append(1)
    for j in range(i):
        if arr[j] > arr[i]:
            dp[i] = max(dp[i], dp[j]+1)

print(max(dp))
