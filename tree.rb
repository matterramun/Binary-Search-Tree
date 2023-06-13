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
    # TODO: If smaller, if left_node != nil, traverse to left_note -> loop, else assign to left node
    # TODO: If larger, if right_node != nil, traverse to right_node -> loop, else assign to right node
  end

  def find(value, current_node = @root)
    # TODO: Create queue to track through depth
    queue = Array.new
    previous_node = nil
    next_left = current_node.left
    next_right = current_node.right

    
    loop do
      break if value == current_node.data

      # TODO: how to recursively loop through untraversed branches...
    end
    [previous_node, current_node, next_left, next_right]
  end

  def delete
  
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
  test_tree = Tree.new((Array.new(15) { rand(1..100) }))
  test_tree.insert(rand(1..100))
  test_tree.pretty_print
end

driver_script
