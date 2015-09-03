class Multibox
	def initialize(array_of_checkboxes)
		@boxes = array_of_checkboxes
		@checked = false
	end

	def flip
		@checked = !@checked
		@boxes.each { |box| box.flip }
	end

	def checked?
		@checked
	end

	def not_empty?
		!@boxes.empty?
	end
end