from typing import List
# 1, special からセット商品を使用した場合、needs から deducted される必要がある。
# 2, セット商品購入に必要なそれぞれの商品の数量が needs で利用可能な数量以下である場合にのみ、セット商品での購入が可能である。

class Solution:
    def shoppingOffers(self, price: List[int], special: List[List[int]], needs: List[int]) -> int:
        def dfs(t_needs):
            for setitems in special:
                # 現在の残っているneedsを全て単価で買う
                tmp_val = 0
                for j in range(len(setitems)):
                    tmp_val += t_needs[j]  * price[j]
                # セット商品を一つ購入したこととし、購入した個数分引き算する
                for k in range(len(purchased)):
                    t_needs[k] -= setitems[k]
                # 必要数量以上購入していなければ、OK
                if min(t_needs) >= 0:
                    tmp_val = min(tmp_val, setitems[-1] + dfs(t_needs))

        return dfs(needs)

sol = Solution()
print(sol.shoppingOffers([2,5],[[3,0,5],[1,2,10]],[3,2]))
    



            
            



