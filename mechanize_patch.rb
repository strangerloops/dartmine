class Mechanize::Form::CheckBox
	def flip
		self.checked = !self.checked?
	end
end