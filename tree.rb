# frozen_string_literal: true

require './lib/node'

class Tree
  attr_accessor :name, :tree

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    root_node = Node.new(array.sort[array.length / 2])
    array.shift
    array = array.uniq
    # TODO: assign next nodes
    array.each { |value| insert(value, root_node) }
    # TODO: tree = stringify node
    root_node
  end

  def insert(value, root_node = @root)
    current_node = root_node
    current_data = current_node.data
    loop do
      break if current_data == value

      if current_data >= value && current_node.left.nil?
        current_node.left = Node.new(value)
        break
      elsif current_data < value && current_node.right.nil?
        current_node.right = Node.new(value)
        break
      elsif current_data >= value && !current_node.left.nil?
        current_node = current_node.left
        current_data = current_node.data
        next
      elsif current_data <= value && !current_node.right.nil?
        current_node = current_node.right
        current_data = current_node.data
        next
      end
    end
  end

  def find(value, current_node = @root)
    stack = []
    previous_node = nil
    next_left = current_node.left
    next_right = current_node.right

    loop do
      if value == current_node.data
        next_left = current_node.left
        next_right = current_node.right
        break
      end

      stack << current_node.left unless current_node.left.nil?
      stack << current_node.right unless current_node.right.nil?
      previous_node = current_node
      current_node = stack.pop
    end
    [previous_node, current_node, next_left, next_right]
  end

  def delete(value)
    target_array = find(value)
    target_array.each {|x| puts x.data unless x.nil?}
    target_array[0].left = target_array[2] unless target_array[2].nil?
    target_array[0].right = target_array[3] unless target_array[3].nil?
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def balanced?; end

  def rebalance; end

  def level_order; end

  def inorder; end

  def preorder; end

  def postorder; end

  def height; end

  def depth; end
end

def driver_script
  p array = (Array.new(11) { rand(1..100) })
  test_tree = Tree.new(array)
  test_tree.insert(rand(1..100)) # Insert a random number to tree
  test_tree.pretty_print
  test_tree.find(array[rand(0..array.length - 1)]) # Find a random node on the tree
  test_tree.delete(array[rand(1..array.length - 1)]) # Remove a random node
  test_tree.pretty_print
end

driver_script
