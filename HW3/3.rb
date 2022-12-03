# frozen_string_literal: true

arr = *(1..5)

# array of objects
class Array
  def foldl(id, &block)
    unless block_given?
      puts 'Please give a block'
      return
    end
    each do |a|
      id = block.call id, a
    end
    id
  end
end

x = arr.foldl 0 do |a, b|
  a - b
end

puts x
