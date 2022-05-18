import io
import sys

sys.stdin = io.StringIO("5\n1 2 3 4 5")

N = input()

arr = list(map(int, input().split()))
ave = sum(arr) / len(arr)

for x in arr:
    if ave <= x:
        print(x)

