import io
import sys

sys.stdin = io.StringIO("3 1 5\n1 2 3 4 5")

A, B, N = input().split()

arr = input().split()

arr2 = []

for x in arr:
    if x == A:
        print(B)
        continue
    print(x)
