import io
import sys
sys.stdin = io.StringIO("5 10\n9\n3\n4\n11\n8")

n, x = map(int, input().split())

arr = [int(input()) for _ in range(n)]

dp = [[False] * (x+1) for _ in range(n)]

dp[0][0] = True

val = arr[0]
while val <= x:
  dp[0][val] = True
  val += arr[0]

for i in range(n):
  for j in range(x+1):
    if dp[i-1][j] == True:
      dp[i][j] = True
    
    val = arr[i]
    while val <= x:
      if dp[i-1][j-val] == True:
        dp[i][j] = True
      val += arr[i]

if dp[n-1][x]:
  print('yes')
else:
  print('no')