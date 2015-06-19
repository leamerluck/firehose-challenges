class Image
	attr_accessor :image

	def initialize(image)
		@image = image
	end

	def index_of_ones
		@ones_indexes = Array.new
		image.each_with_index do |row, row_index|
			row.each_with_index do |num, num_index|
					@ones_indexes.push(row_index,num_index) if num == 1 
			end
		end
	end

	def what_to_change
		@ones_indexes.each do |m,n|
			m = @ones_indexes.shift
			n = @ones_indexes.shift
			image[m-1][n] = 1 if image[m-1][n] != nil
			image[m+1][n] = 1 if image[m+1][n] != nil
			image[m][n-1] = 1 if image[m][n-1] != nil
			image[m][n+1] = 1 if image[m][n+1] != nil
		end
	end

	def output_image
		image.each do |subarry|
			puts subarry.join
		end
	end
		
end

image = Image.new([
			[0,0,0,0],
			[0,1,0,0],
			[0,0,0,1],
			[0,0,0,0]
		])


image.index_of_ones
image.what_to_change
image.output_image
