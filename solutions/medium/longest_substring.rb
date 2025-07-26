# @param {String} s
# @return {Integer}
# s = "aab"
def length_of_longest_substring(s)
  return 0 if s.empty?

  longest_substring = 0
  window_start = 0
  char_positions = {}

  s.each_char.with_index do |char, index|
    if char_positions[char] && char_positions[char] >= window_start
      # Move window start to just after the previous occurrence
      window_start = char_positions[char] + 1
    end
    # Update the position of the current character
    char_positions[char] = index

    # Calculate current window length and update max if needed
    current_length = index - window_start + 1
    longest_substring = [longest_substring, current_length].max
  end

  longest_substring
end
