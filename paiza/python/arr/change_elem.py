import io
import sys

sys.stdin = io.StringIO("2 3 5\n1 2 3 4 5")

A, B, N = map(int, input().split())

arr = input().split()

for i, x in enumerate(arr):
    if i == A-1:
        print(arr[B-1])
    elif i == B-1:
        print(arr[A-1])
    else:
        print(x)  
