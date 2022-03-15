# frozen_string_literal: true

require_relative 'node'

# This LinkedList class represents a Linked List.
class LinkedList
  attr_accessor :head

  def initialize(data = '#a3ffb')
    @head = Node.new(data)
  end

  # This method will verify if the current node tail's is nil. Return a boolean.
  def nil_tail?(current_node)
    return true if current_node.next_node.nil?

    false
  end

  # This method will remove a node in passed index.
  def remove_node_at(index, current_node = head)
    return self.head = current_node.next_node if index.zero?
    return nil if nil_tail?(current_node)

    if index == find(current_node.next_node.value)
      next_current_node = current_node.next_node.next_node
      return current_node.next_node = next_current_node
    end

    remove_node_at(index, current_node.next_node)
  end

  # This method will insert a node in passed index.
  def insert_node_at(value, index, current_node = head)
    next_node_index = find(current_node.next_node.value)
    return "This index doesn't exist..." if current_node.next_node.nil?

    if index == next_node_index
      return current_node.next_node = Node.new(value, current_node.next_node)
    end

    insert_node_at(value, index, current_node.next_node)
  end

  # This method will find the node's index by node's value.
  def find(value, current_node = head, index = 0)
    return index if current_node.value == value
    return nil if nil_tail?(current_node)

    index += 1
    find(value, current_node.next_node, index)
  end

  # This method will verify if some node in the list contains the passed value.
  def contains?(value, current_node = head)
    return true if current_node.value == value
    return false if nil_tail?(current_node)

    contains?(value, current_node.next_node)
  end

  # This method will remove the last list's node.
  def pop(current_node = head, index = 0)
    previous_index = index - 1
    return node_at(previous_index).next_node = nil if nil_tail?(current_node)

    index += 1
    pop(current_node.next_node, index)
  end

  # This method will return the node in the passed index.
  def node_at(index, current_node = head, nodes_counter = 0)
    invalid_index_alert = "This node in #{index} doesn't exist!"
    return current_node if index == nodes_counter
    return invalid_index_alert if nil_tail?(current_node)

    nodes_counter += 1
    node_at(index, current_node.next_node, nodes_counter)
  end

  # This method will return the list's tail(last list's node)
  def tail(current_node = head)
    return current_node if nil_tail?(current_node)

    tail(current_node.next_node)
  end

  # This method will return the total list size(total nodes in the list)
  def size(current_node = head, nodes_counter = 1)
    return nodes_counter if nil_tail?(current_node)

    nodes_counter += 1
    size(current_node.next_node, nodes_counter)
  end

  # This method creates a new node in the end of list.
  def append(value, current_node = head)
    return nil if current_node.nil?
    return current_node.next_node = Node.new(value) if nil_tail?(current_node)

    append(value, current_node.next_node)
  end

  # This method creates a new node in the start of list.
  def prepend(value)
    self.head = Node.new(value, head)
  end

  # This method format the view of nodes for output in terminal.
  def to_s(current_node = head, formated_nodes = '')
    if nil_tail?(current_node)
      return formated_nodes += "|#{current_node.value}|-(next_node)-> nil"
    end

    formated_nodes += "|#{current_node.value}|-(next_node)-> "

    to_s(current_node.next_node, formated_nodes)
  end
end
