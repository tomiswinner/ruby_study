
# 方針　1,全て個別に単価で買う場合を計算とする
# 2, セットが１～３あるのであれば、セット１を使用した場合、セット２、、と、DFSを使用する。

class Solution:
    def shoppingOffers(self, price: List[int], special: List[List[int]], needs: List[int]) -> int:
        # 全て単価で買う
        val = sum(needs[i] * price[i] for i in range(len(needs))]
        tmp_purchased = [number for number in needs]
        for setitems in special:
            tmp_val = 0
            # 購入した分現在の価格に足す
            for j in range(len(setitems)):
                tmp_val += setitems[j] * price[j]
            # 購入した個数分引き算する
            for k in range(len(purchased)):
                tmp_purchased[k] -= setitems[k]
            if max() <= 0:

            
            



