from typing import List

class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        dp = [False for _ in range(len(s)+1)]
        dp[0] = True
        for i in range(1, len(s)+1):
            for j in range(len(wordDict)):
                word_len = len(wordDict[j])
                if i >= word_len and dp[i-word_len] == True and s[i-word_len:i] == wordDict[j]:
                    dp[i] = True
        return dp[-1]

sol = Solution()
print(sol.wordBreak('applepenapple', ['apple', 'pen']))
print(sol.wordBreak('leetcode', ['leet', 'code']))
print(sol.wordBreak('catsandog', ['cats', 'dog', 'sand', 'and', 'cat']))




