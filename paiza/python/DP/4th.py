import io
import sys

sys.stdin = io.StringIO("3 7 -4\n5\n1\n2\n3\n4\n10")

x, d1, d2 = map(int, input().split())

q = int(input())

arr = []
for i in range(q):
    arr.append(int(input()))

maxint = max(arr)

ans = [x]
for i in range(1,maxint+1):
    if (i-1) % 2 == 0:
        ans.append(ans[i-1]+d2)
    else:
        ans.append(ans[i-1]+d1)

for i in range(q):
    print(ans[arr[i]-1])
