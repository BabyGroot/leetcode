# @param {String[]} strs
# @return {String[][]}
# strs = ["eat","tea","tan","ate","nat","bat"]
def group_anagrams(strs)
  result = []
  recognised_anagrams = {}

  # eat
  strs.each do |string|
    re_ordered_string = string.chars.sort.join # ate

    if recognised_anagrams[re_ordered_string].present? # {"ate": ["eat"]}
      recognised_anagrams[re_ordered_string] << string
    else
      recognised_anagrams[re_ordered_string] = ["#{string}"]
    end
  end

  recognised_anagrams.each_value {|arr| result << arr }

  result
end
