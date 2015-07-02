require 'minitest/autorun'
require_relative 'linked-lists-bonus'

class TestLinkedListsBonus < Minitest::Test
	
	describe "Without loop" do
		def setup
			@node1 = LinkedListNode.new(37)
			@node2 = LinkedListNode.new(99, @node1)
			@node3 = LinkedListNode.new(12, @node2)
			@tortoise_hare = ::TortoiseHare.new(@node3)
		end

		def test_finite 
			assert !@tortoise_hare.traverse_nodes
		end
	end

	describe "With loop" do
		def setup
			@node1 = LinkedListNode.new(37)
			@node2 = LinkedListNode.new(99, @node1)
			@node3 = LinkedListNode.new(12, @node2)
			@node1.next_node = @node3
			@tortoise_hare = ::TortoiseHare.new(@node3)
		end

		def test_infinite
			assert @tortoise_hare.traverse_nodes
		end
	end
end
