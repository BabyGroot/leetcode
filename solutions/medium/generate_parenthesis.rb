# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  result = []

  def backtrack(current, open_count, close_count, max_pairs, result)
    # base case: we have used all n pairs
    if current.length == max_pairs * 2
      result << current
      return
    end

    # Add opening parenthesis if we haven't used all n
    if open_count < max_pairs
      backtrack(current + "(", open_count + 1, close_count, max_pairs, result)
    end

    # Add closing parenthesis if it won't make string invalid
    if close_count < open_count
      backtrack(current + ")", open_count, close_count + 1, max_pairs, result)
    end
  end

  backtrack("", 0, 0, n, result)
  result
end
