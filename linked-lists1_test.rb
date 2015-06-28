require 'minitest/autorun'
require_relative 'linked-lists1'

class TestLinkedList < Minitest::Test 

	def setup
		@val1 =  37
		@val2 = 99
		@val3 = 12
	end

	def test_print_values
		@node1 = LinkedListNode.new(@val1)
		@node2 = LinkedListNode.new(@val2, @node1)
		@node3 = LinkedListNode.new(@val3, @node2)
		assert_output ("12 --> 99 --> 37 --> nil\n") {print_values(@node3)}
	end

	def test_reverse_list
		@node1 = LinkedListNode.new(@val1)
		@node2 = LinkedListNode.new(@val2, @node1)
		@node3 = LinkedListNode.new(@val3, @node2)
		reversed = reverse_list(@node3)
		assert_output ("37 --> 99 --> 12 --> nil\n") {print_values(reversed)}
	end

end

