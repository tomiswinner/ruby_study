import io
import sys

sys.stdin = io.StringIO("5 2\ne d c b a")

N, K = map(int, input().split())

arr = input().split()

print(sorted(arr)[K-1])
