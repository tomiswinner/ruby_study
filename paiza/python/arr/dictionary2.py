import io
import sys

sys.stdin = io.StringIO("e d a c b")

string = input().split()

for x in sorted(string):
    print(x)
