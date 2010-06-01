# this is a Unicode character represented in some particular encoding
class UnicodeCharacter
	# unicode code
	# code in that particular encoding
	# character name (like 'eacute')
	def initialize(code_uni, code_enc, name)
		@code_uni = code_uni
		@code_enc = code_enc
		# TODO: might be longer or shorter
		@bytes    = [code_uni].pack('U').unpack('H2H2')
		@name     = name
	end
	
	attr_reader :code_uni, :code_enc, :bytes, :name
end

class UnicodeCharacters < Hash
	# a hash based on the first character
	def add_new_character_first_byte(code_uni, code_enc, name)
		first_byte = [code_uni].pack('U').unpack('H2').first
		if self[first_byte] == nil then
			self[first_byte] = Array.new
		end
		self[first_byte].push(UnicodeCharacter.new(code_uni, code_enc, name))
	end
	# a hash based on the whole unicode codepoint
	def add_new_character(code_uni, code_enc, name)
		self[code_uni] = UnicodeCharacter.new(code_uni, code_enc, name)
	end
end

class Encoding
	def initialize(encoding_name)
		@encoding_name = encoding_name
		@unicode_characters_first_byte = UnicodeCharacters.new
		@unicode_characters = UnicodeCharacters.new
		@lowercase_characters = Array.new

		if encoding_name != 'ascii' then
			read_data
		end
	end

	def convert_to_escaped_characters(str)
		if str.kind_of?(Array) then
			str.each_index do |i|
				str[i] = convert_string_to_escaped_characters(str[i])
			end
		elsif str.kind_of?(String) then
			str = convert_string_to_escaped_characters(str)
		end
		return str
	end

	attr_reader :encoding_name, :unicode_characters, :unicode_characters_first_byte, :lowercase_characters

	def convert_string_to_escaped_characters(str)
		characters = str.unpack('U*')
		new_string = Array.new(characters.length)
		characters.each_index do |i|
			c = characters[i] # character code on position i
			# check if unicode entry with that number exists
			uc = @unicode_characters[c]
			if uc == nil then
				if c < 128 then
					new_string[i] = [c].pack('U')
				elsif c == 8217 # ’
					new_string[i] = "'"
				else
					puts "There must be an error: character #{c} in string #{str} is not ASCII."
				end
			# an unicode character
			else
				new_string[i] = sprintf("^^%x", uc.code_enc)
			end
		end
		return new_string.join('')
	end

private
	def read_data
		# fetch the characters
		encoding_data_dir = File.expand_path("data/encodings")
		filename = "#{encoding_data_dir}/#{@encoding_name}.dat"

		if File.exists?(filename) then
			File.open(filename).grep(/^0x(\w+)\tU\+(\w+)\t(\d*)\t([_a-zA-Z\.]*)$/) do |line|
				# puts line
				code_enc = $1.hex
				code_uni = $2.hex
				if $3.length > 0
					type = $3.to_i
				else
					type = 0
				end
				name = $4
				if type == 1 then
					@unicode_characters_first_byte.add_new_character_first_byte(code_uni, code_enc, name)
					@unicode_characters.add_new_character(code_uni, code_enc, name)
					@lowercase_characters.push(UnicodeCharacter.new(code_uni, code_enc, name))
				end
			end
		else
			# TODO: throw an error
			puts "Invalid encoding name '#{@encoding_name}'."
			puts "File '#{filename}' doesn't exist."
		end
	end
end