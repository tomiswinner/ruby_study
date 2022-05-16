def two_sum(nums, target)
  nums.length.times do |i|
    target2 = target - nums[i]
    nums.length.times do |j|
      if i == j
        next
      end 
      if nums[j] == target2
        return [i, j]
      end
    end
  end
end
