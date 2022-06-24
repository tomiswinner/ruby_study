import collections
import time
from typing import List

# TLE なので再考必要
class Solution:
    cnt = 0
    def findTargetSumWays(self, nums: List[int], target: int) -> int:
        total = 0
        index = 0
        self.dfs(index, total, nums, target)
        return self.cnt
        
    def dfs(self, index, total, nums, target):
        # print(f'index:{index}')
        # print(f'total:{total}')
        if index == len(nums)-1:
            if total+nums[index] == target:
                self.cnt += 1
            if total-nums[index] == target:
                self.cnt += 1
        else:
            self.dfs(index+1, total+nums[index], nums, target)
            self.dfs(index+1, total-nums[index], nums, target)

sol = Solution()
print(sol.findTargetSumWays([1,1,1,1,1], 3))
sol1 = Solution()
print(sol1.findTargetSumWays([1],1))
sol2 = Solution()
print(sol2.findTargetSumWays([1,0],1))
            
            
class Solution:
    def findTargetSumWays(self, nums: List[int], target: int) -> int:
        count = collections.defaultdict(int)
        count[0] = 1
        for n in nums:
            tmp = collections.defaultdict(int)
            for k,v in count.items():
                tmp[k+n] += v
                tmp[k-n] += v
            count = tmp
            print(count)

sol = Solution()
sol.findTargetSumWays([1,1,1,1,1], 3)
