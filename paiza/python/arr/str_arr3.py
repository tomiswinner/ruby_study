import io
import sys

sys.stdin = io.StringIO("5\na b c d e")
N = int(input())

arr =input().split()

for x in arr:
    print(x)
