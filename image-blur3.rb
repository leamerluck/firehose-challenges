require 'pry'

class Image
	attr_accessor :image

	def initialize(image)
		@image = image
	end

	def blur(distance)
		(distance).times do
			index_of_ones
			change_adjacents
		end
	end

	def output_image
		@image.each do |subarry|
			puts subarry.join(' ')
		end
	end

	private

	def index_of_ones
		@ones_indexes = Array.new
		@image.each_with_index do |row, row_index|
			row.each_with_index do |num, num_index|
					@ones_indexes << [row_index,num_index] if num == 1 
			end
		end
	end

	def upper_edge?(y,x)
		image[y-1][x] == nil
	end

	def lower_edge?(y,x)
		image[y+1][x] == nil
	end

	def right_edge?(y,x)
		image[y][x-1] == nil
	end

	def left_edge?(y,x)
		image[y][x+1] == nil
	end

	def set_one(y,x) 
		image[y][x] = 1
	end

	def adjacents_up(y,x)
		set_one(y-1, x) unless y == 0 || upper_edge?(y,x) 
	end

	def adjacents_down(y,x)
		set_one(y+1, x) unless y == @image.length - 1 || lower_edge?(y,x) 
	end

	def adjacents_right(y,x)
		set_one(y,x-1) unless x == 0 || right_edge?(y,x)
	end

	def adjacents_left(y,x)
		set_one(y, x+1) unless x == @image[y].length - 1 || left_edge?(y,x)
	end

	def change_adjacents
		@ones_indexes.each do |y,x|
			adjacents_up(y,x)
			adjacents_down(y,x)
			adjacents_left(y,x)
			adjacents_right(y,x)
		end
	end	
end

image = Image.new([
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,1,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,1]			
		])

image.blur(3)
image.output_image