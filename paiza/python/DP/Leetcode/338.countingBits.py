from typing import List

class Solution:
    def countBits(self, n: int) -> List[int]:
        dp = [0] * (n+1)
        for i in range(1, n+1):
            dp[i] = str(bin(i)).count('1')
        return dp

sol = Solution()
print(sol.countBits(5))
