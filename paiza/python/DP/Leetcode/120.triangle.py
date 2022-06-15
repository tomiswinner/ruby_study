
from typing import List

class Solution:
    def minimumTotal(self, triangle: List[List[int]]) -> int:
        m = len(triangle)
        dp = [[0] * (m+1) for _ in range(m+1)]

        for i in range(m-1, -1, -1):
            for j in range(0, i+1):
                dp[i][j] = min(dp[i+1][j], dp[i+1][j+1]) + triangle[i][j]
        return dp[0][0]


sol = Solution()
print(sol.minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]]))
