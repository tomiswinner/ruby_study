class Solution:
  def jump(self, nums: List[int]) -> int:
    next_arrival_point = nums[0]
    current_endpoint = 0
    ans = 0
    i = 1
    while 
      if i >= current_endpoint:
        current_endpoint = next_endpoint
        ans += 1
      next_endpoint = max(next_arrival_point, i + N[i])
      i += 1





      




# https://dev.to/seanpgallivan/solution-jump-game-ii-cn3
# N[i]にいる場合、N[i] = 4 であれば、N[i+1],N[i+2],N[i+3],N[i+4] が１ジャンプで到達できる最長到達点となる。
# このとき、N[i+1~4]の中で、そこからジャンプしたときに最も遠くまで進める場所を選べばいい。
# ただし、N[i+4]まで精査しない限り、どこでジャンプするかわからない。
