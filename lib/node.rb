# frozen_string_literal: true

class Node
  attr_accessor :data, :next_node

  def initialize(data, left_node, right_node = nil)
    @data = data
    @left_node = left_node
    @right_node = right_node
  end
end

