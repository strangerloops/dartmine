require 'rubygems'
require 'mechanize'
require 'roo'
require 'google_drive'
require_relative 'hashes'
require_relative 'mechanize_patch'
require_relative 'multibox'

def get_csv_from params
	inputs = params.values
	form = Mechanize.new.get("http://recidivism.cityofnewyork.us/index.php?m=search").forms.first
	define_singleton_method "form" do form end
	scrape_hash = make_key_multibox_hash_from inputs
	legend = get_legend_for params
  (csv_legend legend) << "<br>" << csv_headers_for(scrape_hash.keys) << make_csv_from(scrape_hash)
end

def parse_input input
	input.scan(/(?<={).+?(?=})/m)
end

def multiboxes_for_pattern(checkbox_index_strings, pattern)
	checkbox_index_strings.map do |checkbox_index_string|
		Multibox.new(checkbox_index_string.split.map do |checkbox_index|
			form.checkboxes_with(:name => pattern)[checkbox_index.to_i]
		end)
	end
end

def make_key_multibox_hash_from inputs
	key_pattern_hash.keys.map do |key|
		multiboxes = multiboxes_for_pattern(parse_input(inputs.shift), key_pattern_hash[key])
		if multiboxes.any? then [key, multiboxes] else next end
	end.compact.to_h
end

def csv_headers_for keys
	(keys.reduce do |k1, k2| k1 + ",#{k2}" end.dup) + ",Recidivism rate (%),Sample size<br>"
end

def make_csv_from hash
	csv = ""
	arrays = hash.values
	combos = arrays.first.product(*arrays[1..-1])
	combos.each do |combo|
		indexes_to_write = combo.map do |multibox|
			multibox.flip
			arrays.select do |array| array.include? multibox end.first.index multibox
		end
		result_page = Mechanize.new.submit form
		if result_page.link_with(:text => /DOWNLOAD IMAGE/) # enough results for a recidivism value
			indexes_to_write.each do |index| csv << "#{index}," end
			csv.chomp ','
			csv << "#{result_page.search('span')[0].text.chomp('%')}," # recidivism rate
			sample_size = result_page.search("div[class='content-pad'] strong")[0].text.split[0].tr ",", ""
			csv << "#{sample_size}"
			csv << "<br>"
		end
		combo.each do |multibox| multibox.flip end
	end
	csv
end

def get_legend_for params
	params.map do |key, val|
	 	[key, ((parse_input val).map do |string_of_indexes|
	 		string_of_indexes.split.map(&:to_i).map do |index|
	 			hash_hash[key][index]
	 		end.reduce do |a, b|
	 			"#{a} OR #{b}"
	 		end
	 	end).enum_for(:each_with_index).map do |description, i|
	 		[i, description]
	 	end.to_h]
	end.to_h.delete_if do |key, val|
		val.empty?
	end
end

def csv_legend legend
	legend.map do |key, val|
		"#{key}: #{string_for_single_legend_hash val}"
	end.reduce do |a, b|
		"#{a}<br>#{b}"
	end << "<br>"
end

def string_for_single_legend_hash hash
	hash.map do |key, val|
		"#{key} = #{val}"
	end.reduce do |a, b|
		"#{a}, #{b}"
	end
end




