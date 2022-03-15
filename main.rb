# frozen_string_literal: true

require_relative 'node'
require_relative 'linked_list'

list = LinkedList.new
puts ''
puts 'pure list'
puts list
list.append('#fffff')
puts ''
puts 'append'
puts list
list.prepend('#8ccda7')
puts ''
puts 'prepend'
puts list
puts ''
puts 'list size'
puts "--> #{list.size}"
puts ''
puts 'list tail'
puts "--> #{list.tail.value}"
puts ''
puts 'node at index, valid index! index: 1'
puts "--> #{list.node_at(1).value}"
puts ''
puts 'node at index, invalid index!'
puts "--> #{list.node_at(3)}"
puts ''
puts 'list before pop'
puts list
puts ''
puts 'list after pop'
list.pop
puts list
puts ''
puts 'list contains? #a3ffb'
puts list.contains?('sa3ffb')
puts ''
puts 'list find for index value: #a3ffb'
puts list.find('#a3ffb')
puts ''
puts 'insert node_at index 1'
list.insert_node_at('#fafaf', 1)
puts list
list.append('#ccccc')
list.append('#cbcbc')
puts list
list.pop
puts list
list.pop
puts list
list.prepend('#aaaaaa')
puts list
list.insert_node_at('#ffaff', 1)
puts ''
puts 'after insert_at 1'
puts list
puts ''
puts 'remove_node_at'
list.remove_node_at(0)
puts list
