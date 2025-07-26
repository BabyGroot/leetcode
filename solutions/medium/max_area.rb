# @param {Integer[]} height
# @return {Integer}
# height = [1,8,6,2,5,4,8,3,7]
def max_area(height)
  left_pos = 0
  right_pos = height.length - 1
  max_area = 0

  while left_pos < right_pos
    # calculate area
    width = right_pos - left_pos
    current_height = [height[left_pos], height[right_pos]].min
    area = width * current_height

    max_area = [max_area, area].max

    # move the pointer with the smaller height
    # The only way the area will get larger is by having a larger verticle
    # because we are starting with the biggest posible horizontal value and
    # decreasing that on each iteration.  Therefore l x b, where b gets smaller, can only
    # increas if l grows
    if height[left_pos] < height[right_pos]
      left_pos += 1
    else
      right_pos -= 1
    end
  end
  max_area
end


def max_area_brute_force(height)
  max_area = 0

  (0...height.length).each do |initial_pos|
    (initial_pos + 1...height.length).each do |next_pos|
      max_height = [height[initial_pos], height[next_pos]]].min

      width = next_pos - initial_pos
      area = max_height * width

      max_area = [max_area, area].max
    end
  end
  max_area
end
