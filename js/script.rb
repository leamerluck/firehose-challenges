add_numbers = lambda do |num1, num2|
	return num1 + num2
end

subt_numbers = lambda do |num1, num2|
	return num1 - num2
end

def combine(m, num1, num2)
	return m.call(num1, num2)
end

puts combine(subt_numbers, 3, 4)