# frozen_string_literal: true

arr = [20, 1, 15, 3, 10, 5, 8, 11, 12, 13, 17, 23, 29]

# Returns length of longest Longest subsequence forming an Arithmetic Progression
def long_ar(arr)
  n = arr.length
  max_l = 0
  (0...n).each do |i|
    max_l = [1, max_l].max
    ((i+1)...n).each do |j|
      max_l=[2,max_l].max
      d = arr[j]-arr[i]
      a = arr[j]
      l = 2
      ((j + 1)...n).each do |k|
        if a + d == arr[k]
          l += 1
          a = arr[k]
        end
      end
      max_l = [max_l, l].max
    end
  end
  max_l
end

puts long_ar arr
