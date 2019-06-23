class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end

  def add_node(num)
    if num < @payload 
      if @left == nil
        @left = BinaryTree.new(num, nil, nil)
      else 
        @left.add_node(num)
      end  
    elsif num > @payload 
      if @right == nil
        @right = BinaryTree.new(num, nil, nil)
      else
        @right.add_node(num)
      end
    end
  end

  def get_sorted_array
    sort_array = []

    if @left != nil
      sort_array += @left.get_sorted_array
    end

    sort_array.push(@payload)

    if @right != nil
      sort_array += @right.get_sorted_array
    end

    return sort_array
  end

end

def sort(array)

  root = BinaryTree.new(array[0], nil, nil)

  array[1..-1].each do |num|
    root.add_node(num)
  end

  return root.get_sorted_array
end

puts sort([7, 4, 9, 1, 6, 14, 10])