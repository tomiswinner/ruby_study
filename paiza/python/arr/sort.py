import io
import sys

sys.stdin = io.StringIO("10\n10 9 8 7 6 5 4 3 2 1")

N = int(input())

arr = map(int, input().split())

for x in sorted(arr):
    print(x)
