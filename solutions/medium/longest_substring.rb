# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  # s = "abcabcbb"
  longest_substring = 0
  current_longest_substring = 0
  chars_matched = {}
  s.split.each do |char|
    if chars_matched["char"]
      current_longest_substring = 1
      chars_matched = {}
    else
      current_longest_substring += 1
      chars_matched["char"] = 1
    end

    if current_longest_substring > longest_substring
      longest_substring = current_longest_substring
    end
  end

  longest_substring
end
