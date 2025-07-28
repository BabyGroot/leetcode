# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums.sort!
  closest_sum = nums[0] + nums[1] + nums[2]

  (0...nums.length - 2).each do |i|
    left = i + 1
    right = nums.length - 1

    while left < right
      current_sum = nums[i] + nums[left] + nums[right]

      # update closest sum if current is closer to target
      if (current_sum - target).abs < (closest_sum - target).abs
        closest_sum = current_sum
      end

      # Move the pointers based on comparison to target
      if current_sum < target
        left += 1
      else
        right -= 1
      end
    end
  end

  closest_sum
end
