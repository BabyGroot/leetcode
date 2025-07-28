# "23"
def letter_combinations(digits)
  # Your hashmap idea - perfect!
   phone_map = {
     '2' => ['a', 'b', 'c'],
     '3' => ['d', 'e', 'f'],
     '4' => ['g', 'h', 'i'],
     '5' => ['j', 'k', 'l'],
     '6' => ['m', 'n', 'o'],
     '7' => ['p', 'q', 'r', 's'],
     '8' => ['t', 'u', 'v'],
     '9' => ['w', 'x', 'y', 'z']
   }

   result = []

   backtrack("", digits, phone_map, result)
   result
end

def backtrack(combination, next_digits, phone_map, result)
  # Base case: no more digits to process
  if next_digits.empty?
    result << combination
    return
  end

  # Get current digit and its possible letters
  current_digit = next_digits[0]
  letters = phone_map[current_digit]

  # Try each possible letter for current digit
  letters.each do |letter|
    backtrack(combination + letter, next_digits[1..-1], phone_map, result)
  end
end
