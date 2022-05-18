import io
import sys

sys.stdin = io.StringIO("1 10 10\n1 2 3 4 5 6 7 8 9 10")

A, B, N = map(int, input().split())
arr = input().split()

for x in arr[A-1:B]:
    print(x)
