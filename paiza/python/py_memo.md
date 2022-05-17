+ map で組み込み以外を使う。
arr = map(lambda x: x.split(), "1 2 3 4 5 6\n8 1 3 3 1 8".splitlines())                  

+ stdin
import io
import sys

_INPUT = "4 3\n1 2 3\n8 1 3\n10 100 0\n12 24 84"
sys.stdin = io.StringIO(_INPUT)

N, M = input().split()

https://qiita.com/ajim/items/4d350710ba70056f5f6f


