# frozen_string_literal: true

# This Node class represent a node in a LinkedList
class Node
  attr_accessor :value, :next_node

  def initialize(data, next_node = nil)
    @value = data
    @next_node = next_node
  end
end
