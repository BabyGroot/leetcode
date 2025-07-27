# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 if root.nil?

  # Recursively find the depth of left and right subtrees
  left_depth = max_depth(root.left)
  right_depth = max_depth(root.right)

  # current depth is 1 + max of subtree depths
  1 + [left_depth, right_depth].max
end
