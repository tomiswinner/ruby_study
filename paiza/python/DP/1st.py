import io
import sys

sys.stdin = io.StringIO("0 7 9")

x, d, k = map(int, input().split())

arr = [x]

for i in range(1,k+1):
    arr.append(arr[i-1] + d)

print(arr[k-1])
