# @param {String} s
# @return {Integer}

def length_of_longest_substring(s)
  longest_substring = 0
  current_longest_substring = 0
  chars_matched = {}
  s.each_char do |char|
    if chars_matched[char].nil?
      current_longest_substring += 1
      chars_matched[char] = 1
    else
      current_longest_substring = 0
      chars_matched = {}
    end

    if current_longest_substring > longest_substring
      longest_substring = current_longest_substring
    end
  end
  longest_substring
end
