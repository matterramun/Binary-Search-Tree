# frozen_string_literal: true

class Node
  attr_accessor :data, :left, :right

  def initialize(data, left_node = nil, right_node = nil)
    @data = data
    @left = left_node
    @right = right_node
  end
end
