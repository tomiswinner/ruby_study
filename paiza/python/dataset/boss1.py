import io
import sys

sys.stdin = io.StringIO("3 5\n1 2 3\n0 10\n0 12\n2\n1\n2")

n, q = map(int, input().split())

arr = list(map(int, input().split()))

for i in range(q):
  query = input()
  if query[0] == '0':
    arr.append(int(query.split()[1]))
  elif query[0] == '1':
    arr.pop()
  elif query[0] == '2':
    print(*arr)


