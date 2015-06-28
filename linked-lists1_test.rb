require 'minitest/autorun'
require_relative 'linked-list1'

class TestLinkedListOne < Minitest::Test 
	def test_print_values 
		reverseList = Stack.new(37,99,12)
		assert_equal "12 --> 99 --> 37", reverseList.pop
	end
end

