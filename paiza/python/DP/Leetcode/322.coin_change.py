from typing import List

class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        
        # initialize
        dp = [[float('inf')] * (amount+1) for _ in range(len(coins))]
        for i in range(amount+1):
            if i % coins[0] == 0:
                dp[0][i] = int(i / coins[0])

        for i in range(1, len(coins)):
            for j in range(amount+1):

                if dp[i-1][j] != float('inf'):
                    dp[i][j] = min(dp[i][j], dp[i-1][j])

                if j - coins[i] < 0:
                    continue

                if dp[i][j-coins[i]] != float('inf'):
                    dp[i][j] = min(dp[i][j], dp[i][j-coins[i]] + 1)

        if dp[len(coins)-1][amount] == float('inf'):
            return -1
        else:
            return dp[len(coins)-1][amount]

sol = Solution()
print(sol.coinChange([1,2,5], 11))
print(sol.coinChange([1],0))




