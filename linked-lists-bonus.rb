require 'pry'

class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end
end

class TortoiseHare
	attr_accessor :start, :fast, :slow

	def initialize(start)
		@start = start
		@fast = fast = start
		@slow = slow = start
	end

	def traverse_nodes
		return false if fast.next_node.nil?
			moves
	end

	def moves
		if @fast.next_node != nil && @fast.next_node.next_node !=nil
				@fast = @fast.next_node.next_node
				@slow = @slow.next_node
				nodes_equal
		end
	end

	def nodes_equal
		@fast == @slow ? (return true) : (traverse_nodes)
	end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

TortoiseHare.new(node3).traverse_nodes


node1.next_node = node3
TortoiseHare.new(node3).traverse_nodes

