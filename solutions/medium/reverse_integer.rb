# @param {Integer} x
# @return {Integer}
INT_MAX = 2**31 - 1
INT_MIN = -2**31
def reverse_integer(x)
  result = 0

  while x != 0
    # Extract the last digit
    digit = x % 10
    x /= 10

    if x < 0 && digit > 0
      digit -= 10
      x += 1
    end

    if result > INT_MAX / 10  || (result == INT_MAX / 10 && digit > 7)
      return 0
    end
    if result < INT_MIN / 10 || (result == INT_MIN / 10 && digit < -8)
      return 0
    end

    result = result * 10 + digit
  end

  result
end

def reverse_integer_ruby(x)
  # Handle sign
  sign = x < 0 ? -1 : 1
  x = x.abs

  # Reverse digits
  result = 0
  while x > 0
    result = result * 10 + x % 10
    x /= 10
  end

  result *= sign

  # Check bounds
  result > INT_MAX || result < INT_MIN ? 0 : result
end
