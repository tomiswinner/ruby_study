from typing import List

class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        for i in range(len(wordDict)):
            line = s
            for j in range(len(wordDict)):
                if wordDict[j] in line:
                    line.replace(wordDict[j], '', -1)
                else:
                    continue
                
                if len(line) == 0:
                    return True
        return False

sol = Solution()

print(sol.wordBreak("applepenapple",["apple","pen"]))

            

                

                

