# frozen_string_literal: true

# Reverses a string taken fron stdin

print 'Input String : '
in_str = gets.chomp

# Reverses the string
def rev_str(str)
  ans = String.new(capacity: str.length)
  (1..str.length).each do |i|
    ans << str[str.length - i]
  end
  ans
end

result = rev_str in_str
puts "Output String : #{result}"
