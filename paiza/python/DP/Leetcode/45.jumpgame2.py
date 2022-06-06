class Solution:
  def jump(self, nums: List[int]) -> int:
    n_now = nums[0]
    i_now = 0
    cnt = 0
    while i_now + n_now < len(nums)-1:
      maximum = max(nums[i_now+1:i_now+n_now+1])
      

