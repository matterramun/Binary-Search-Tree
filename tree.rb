# frozen_string_literal: true

require './lib/node'

class Tree
  attr_accessor :name, :tree

  def initialize(array)
    @root = build_tree(array)
    p @root
    p @root.data
  end

  def build_tree(array)
    root_node = Node.new(array.sort![0])
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
    # TODO: bigger or smaller than root?
    loop do
      break if current_data == value

      p "node #{current_node}"
      p "data #{current_data}"
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
      elsif current_data == value && !current_node.right.nil?
        current_node = current_node.right
        current_data = current_node.data
        next
      end
    end
    # TODO: If smaller, if left_node != nil, traverse to left_note -> loop, else assign to left node
    # TODO: If larger, if right_node != nil, traverse to right_node -> loop, else assign to right node
  end

  def delete; end

  def pretty_print(node = @root, prefix = '', is_left: true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def to_s(depth)
    # TODO: Read node, append to string
    # TODO: traverse left node, append to string
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

test_tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
test_tree.insert(5)
test_tree.pretty_print
