+ python atcoder 2秒制限。
Nが10**6 → O(N)かO(N log N)
Nが10**5 → O(N log N)かO(N log2 N)
Nが3000 → O(N2)
Nが300 → O(N3)(シンプルな処理)
Nが100 → O(N3)
Nが50 → O(N4)
Nが20 → O(2N)かO(N*2N)
くらいかなあという感じですね。
[こちら](https://cppx.hatenablog.com/entry/2017/08/06/104144)<br>

+ map で組み込み以外を使う。
arr = map(lambda x: x.split(), "1 2 3 4 5 6\n8 1 3 3 1 8".splitlines())                  

+ extend
append と違い、配列を展開して連結してくれる。<br>

+ stdin
import io
import sys

_INPUT = "4 3\n1 2 3\n8 1 3\n10 100 0\n12 24 84"
sys.stdin = io.StringIO(_INPUT)

N, M = input().split()

https://qiita.com/ajim/items/4d350710ba70056f5f6f


