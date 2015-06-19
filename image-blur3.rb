require 'pry'

class Image
	attr_accessor :image

	def initialize(image)
		@image = image
	end

	def index_of_ones
		@ones_indexes = Array.new
		@image.each_with_index do |row, row_index|
			row.each_with_index do |num, num_index|
					@ones_indexes.push(row_index,num_index) if num == 1 
			end
		end
	end

	def change_adjacents
		@ones_indexes.each do |y,x|
				y = @ones_indexes.shift
				x = @ones_indexes.shift
				puts image[5][3]
				image[y-1][x] = 1 if image[y-1][x] != nil #left
				image[y+1][x] = 1 if image[y+1][x] != nil #right
				image[y][x-1] = 1 if image[y][x-1] != nil #down
				image[y][x+1] = 1 if image[y][x+1] != nil #up
		end
	end

	def blur(distance)
		distance.times do
			print index_of_ones
			change_adjacents
		end
	end

	def output_image
		@image.each do |subarry|
			puts subarry.join
		end
	end
		
end

image = Image.new([
			[0,0,0,0,0],
			[0,0,0,0,0],
			[0,0,0,0,0],
			[0,0,1,0,0],
			[0,0,0,0,0],
			[0,0,0,0,0]

		])

image.blur(3)
image.output_image