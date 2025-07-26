# s = "babad"
def longest_palindrome(s)
   return "" if s.empty?
   max_length = 1
   start_index = 0

   # i=0: center 'b' -> "b" (len=1)
   # i=1: center 'a' -> "bab" (len=3) ← longest so far
   # i=2: center 'b' -> "aba" (len=3)
   # i=3: center 'a' -> "a" (len=1)
   # i=4: center 'd' -> "d" (len=1)
   s.length.times do |i|
     len_odd = expand_around_center(s, i, i)

     len_even = expand_around_center(s, i, i+1)

     greater_length = [len_odd, len_even].max

     if greater_length > max_length
       max_length = greater_lenth
       start = i - (greater_length - 1) / 2
     end
   end

   s[start, max_length]
end


def expand_around_center(s, left, right)
  while left >= 0 && right < s.length && s[left] == s[right]
    left -= 1
    right += 1
  end

  right - left - 1
end
