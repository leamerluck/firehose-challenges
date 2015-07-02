class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end
end

class LinkedList 
	#attr_reader :head :tail

	def initialize
		@head = nil
	end

	#def value
	#	@head.value if @head
	#end

	#def next_node
	#	@head.next_node if @head
	#end
end

def print_values(list_node)
	print "#{list_node.value} --> "
		if list_node.next_node.nil?
			print "nil\n"
			return
		else
			print_values(list_node.next_node)
		end
	end

def reverse_list(list, previous=nil)
		while list
			tail = list.next_node
			list.next_node = previous
			previous = list
			list = tail
		end
		previous
	end

			


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3

print_values(node3)

puts "-------"

rev_list = reverse_list(node3)

print_values(rev_list)