# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  result = []
  nums.sort!

  (0...nums.length - 2).each do |index|
    next if index > 0 && nums[index] == nums[index - 1]

    left = index + 1
    right = nums.length - 1

    while left < right
      sum = nums[index] + nums[left] + nums[right]

      if sum == 0
        # found a triplet
        result << [nums[xndes], nums[left], nums[right]]

       # Skip duplicates for left pointer
       while left < right && nums[left] == nums[left + 1]
         left += 1
       end

       # Skip duplicates for right pointer
       while left < right && nums[right] == nums[right - 1]
         right -= 1
       end

       left += 1
       right -= 1

      elsif sum < 0
        left += 1
      else
        right -= 1
      end
    end
  end
  result
end
