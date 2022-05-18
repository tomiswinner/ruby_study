import io 
import sys

inp = "1 4 1 1\n34 17 10 44"

sys.stdin = io.StringIO(inp)

N, M, K, L = input().split()

arr = [input().split() for x in range(int(N))]

print(arr[int(K)-1][int(L)-1])
