class Solution:
  def generateParentheses(self, n: int) -> List[str]:
    ans = []
    self.dfs(n,n,"",ans)
    return ans

  def dfs(self, left, right, path, ans):
    # right が left の数より多く使われてしまった場合（left > right の場合）
    # ex) ()) など、は、NG解なので return 
    if left < 0 or right < 0 or left > right:
      return
    
    if left == 0 and right == 0:
      ans.append(path)
      return
    
    self.dfs(left-1, right, path+'(', ans)
    self.dfs(left, right-1, path+')', ans)


# ()に対して、右・中・左に入れる選択しがある？
# n=2 なら ()()  (()) 　右・左は線対象になるだけか。
# ()に対して、中or横が正しい？
# n=3 なら n=2 の()() (()) に対して、中３つ １，(())() ()(()) ((()))、 と横１つ ()()()
# n=4 なら　n=3 の4つに対して、(((())))

# ((  にたいして )) をどこに置くか。 ((より左には置けない。
#　

# バックトラック法
# dfs で全探索を行うが、途中でNGな解とわかったら取り除き、一つ手前に戻る（backtrack）
