import io
import sys

sys.stdin = io.StringIO("2 3\n1 2\n3 4 5")

N, M = input().split()

arr = input().split()
arr2 = input().split()

arr.extend(arr2)
for x in arr:
    print(x)
