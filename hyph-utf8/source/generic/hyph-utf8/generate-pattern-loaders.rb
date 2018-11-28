#!/usr/bin/env ruby
# encoding: utf-8

# this file auto-generates loaders for hyphenation patterns - to be improved # No shit, Sherlock -- AR 2018-11-27

require_relative 'lib/tex/hyphen/language.rb'
include TeX::Hyphen
include Language::TeXLive

languages = Language.all

#text_if_native_utf = "\input pattern-loader.tex\n\\ifNativeUtfEightPatterns"

print 'Generating loaders for '
languages.each do |language|

# puts language.bcp47
string_enc = (language.encoding == nil) ? "" : language.encoding.upcase + " "

################
# Header texts #
################

# a message about auto-generation
# TODO: write a more comprehensive one
text_header =
"% filename: loadhyph-#{language.bcp47}.tex
% language: #{language.babelname}
%
% Loader for hyphenation patterns, generated by
%     source/generic/hyph-utf8/generate-pattern-loaders.rb
% See also http://tug.org/tex-hyphen
%
% Copyright 2008-#{Time.now.year} TeX Users Group.
% You may freely use, modify and/or distribute this file.
% (But consider adapting the scripts if you need modifications.)
%
% Once it turns out that more than a simple definition is needed,
% these lines may be moved to a separate file.
%"

comment_engine_8bit = "% 8-bit engine (such as TeX or pdfTeX)"
comment_engine_ptex = "% pTeX"

text_engine_ascii   = ["% ASCII patterns - no additional support is needed",
                       "\\message{ASCII #{language.message}}",
                       "\\input hyph-#{language.bcp47}.tex"]
text_engine_8bit    = ["    #{comment_engine_8bit}",
                       "    \\message{#{string_enc}#{language.message}}"]
text_engine_ptex    = ["    #{comment_engine_ptex}",
                       "    \\message{#{string_enc}#{language.message}}"]
text_engine_ptex_no = ["    #{comment_engine_ptex}",
                       "    \\message{No #{language.message} - only for Unicode engines}",
                       "    %\\input zerohyph.tex"]
text_patterns_ptex  =  "    \\input hyph-#{language.bcp47}.#{language.encoding}.tex"
text_patterns_old   =  "    \\input #{language.legacy_patterns}"
text_patterns_conv  =  "    \\input conv-utf8-#{language.encoding}.tex"

###########
# lccodes #
###########

lccodes_common = []
if language.has_apostrophes? then
	lccodes_common.push("\\lccode`\\'=`\\'")
end
if language.has_hyphens? then
	lccodes_common.push("\\lccode`\\-=`\\-")
end

	next if language.use_old_loader
		print language.bcp47, ' '

		filename = File.join(PATH::LOADER, language.loadhyph)
		File.open(filename, "w") do |file|
			# puts language.bcp47
			file.puts text_header
			file.puts('\begingroup')

			if lccodes_common.length > 0 then
				file.puts lccodes_common.join("\n")
			end

########################################
# GROUP nr. 1 - ONLY USABLE WITH UTF-8 #
########################################
			# some special cases first
			#
			# some languages (sanskrit) are useless in 8-bit engines; we only want to load them for UTF engines
			# TODO - maybe consider doing something similar for ibycus
			if language.unicode_only?
				language.print_stuff(file, true)
				file.puts('\else')
				language.print_stuff(file, false)
				file.puts('\fi\else')
				file.puts(text_engine_ptex_no)
				file.puts('\fi')

#######################
# GROUP nr. 2 - ASCII #
#######################
			elsif ['it', 'pms', 'rm'].include?(language.bcp47)
				language.print_stuff(file, true)
				file.puts('\else')
				file.puts(text_engine_8bit)
				language.print_input_line(file)
				file.puts('\fi\else')
				file.puts(text_engine_ptex)
				language.print_input_line(file)
				file.puts('\fi')
			# for ASCII encoding, we don't load any special support files, but simply load everything
			elsif language.encoding == 'ascii' then
				file.puts(text_engine_ascii)
####################################
# GROUP nr. 3 - different patterns #
####################################
			# when lanugage uses old patterns for 8-bit engines, load two different patterns rather than using the converter
			elsif language.use_old_patterns_comment then
				language.print_stuff(file, true)
				file.puts('\else')
				file.puts(text_engine_8bit)
				# explain why we are still using the old patterns
				file.puts("    % #{language.use_old_patterns_comment}")
				file.puts(text_patterns_old)
				file.puts('\fi\else')
				file.puts(text_engine_ptex)
				# greek, coptic
				if language.encoding == nil then
					file.puts(text_patterns_old)
				else
					file.puts(text_patterns_ptex)
				end
				file.puts('\fi')
#########################
# GROUP nr. 4 - regular #
#########################
			else
				language.print_stuff(file, true)
				file.puts('\else')
				file.puts(text_engine_8bit)
				if language.bcp47 == 'la-x-liturgic'
					file.puts(text_patterns_ptex)
				else
					file.puts(text_patterns_conv)
					language.print_input_line(file)
				end
				file.puts('\fi\else')
				file.puts(text_engine_ptex)
				file.puts(text_patterns_ptex)
				file.puts('\fi')
			end
#######
# end #
#######
			file.puts('\endgroup')
		end
end

puts
