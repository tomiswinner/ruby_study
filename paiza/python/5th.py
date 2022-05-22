import io
import sys

sys.stdin = io.StringIO("7")

k = int(input())

arr = [1,1]

for i in range(2, k):
    arr.append(arr[i-2] + arr[i-1])

print(arr[k-1])
