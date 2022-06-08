from typing import List

class Solution:
    def canJump(self, nums: List[int]) -> bool:
        if len(nums) == 1:
            return True
        max_reachable = nums[0]
        i = 1
        while max_reachable < len(nums)-1:
            # i が max_reachable より遠い = 到達不可能な場所にいる。
            if i > max_reachable:
                return False
            max_reachable = max(max_reachable, nums[i]+i)
            i += 1
        return True


sol = Solution()
print(sol.canJump([2,3,1,1,4]))
print(sol.canJump([3,2,1,0,4]))
print(sol.canJump([2,0,0]))
print(sol.canJump([0]))


