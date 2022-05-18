import io
import sys

sys.stdin = io.StringIO("3 5\n1 2 3 4 5")
N, M = input().split()

arr = input().split()

print(arr.index(N)+1)
