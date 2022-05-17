import io
import sys

_INPUT = "4 3\n1 2 3\n8 1 3\n10 100 0\n12 24 84"
sys.stdin = io.StringIO(_INPUT)

N, M = input().split()

arr = [input().split() for x in range(int(N))]
for x in arr:
    print(*x)
