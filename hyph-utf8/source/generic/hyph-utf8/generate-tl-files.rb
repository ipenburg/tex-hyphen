#!/usr/bin/env ruby
# encoding: utf-8

# this file auto-generates tlpsrc files for hyphenation patterns - to be improved

require_relative 'lib/tex/hyphen'
require_relative 'lib/tex/hyphen/texlive'
include TeX::Hyphen
include TeXLive

#--------#
# TLPSRC #
#--------#

print 'Generating .tlpsrc files for packages: '
Package.all.sort.each do |package|
	tlpsrcname = File.join(PATH::TLPSRC, sprintf('hyphen-%s.tlpsrc', package.name.safe))
	file_tlpsrc = File.open(tlpsrcname, 'w')
	print package.name.safe, ' '

	file_tlpsrc.puts "category TLCore"
	package.list_dependencies.each do |dependency|
		file_tlpsrc.puts dependency
	end

	# FIXME Still doesn’t work well for Latin
	file_tlpsrc.printf "shortdesc %s.\n", package.description_s
	package.description.split("\n").each do |line|
    file_tlpsrc.printf "longdesc %s\n", line
  end
	package.languages.each do |language|
		file_tlpsrc.printf  "execute AddHyphen \\\n\tname=%s%s \\\n", language.babelname, language.list_synonyms
		file_tlpsrc.printf "\t%s \\\n\t%s", language.list_hyphenmins, language.list_loader
		if language.patterns_line + language.exceptions_line != ""
			file_tlpsrc.printf " \\\n\t%s \\\n\t%s", language.patterns_line, language.exceptions_line
		end
		if language.bcp47 == "mn-cyrl-x-lmc" then
			file_tlpsrc.printf " \\\n\tluaspecial=\"disabled:only for 8bit montex with lmc encoding\""
		end
		# end-of-line
		file_tlpsrc.puts
	end

	# documentation
	package.list_support_files('doc').sort.each do |filename|
		file_tlpsrc.printf "docpattern d texmf-dist/%s\n", filename
	end

	# sources
	package.list_support_files('source').sort.each do |filename|
		file_tlpsrc.printf "srcpattern d texmf-dist/%s\n", filename
	end

	package.list_run_files.sort.uniq.each do |filename|
		file_tlpsrc.printf "runpattern f texmf-dist/%s\n", filename
	end
	file_tlpsrc.close
end
puts

#--------------------------#
# language.dat and friends #
#--------------------------#
if `which tlmgr` == ""
  puts "ERROR: tlmgr not found.  Please install tlmgr in order to proceed."
  exit -1
end

system sprintf "tlmgr generate --dest %s language.dat", File.join(PATH::LANGUAGE_DAT, 'language.dat')
system sprintf "tlmgr generate --dest %s language.dat.lua", File.join(PATH::LANGUAGE_DAT, 'language.dat.lua')

# Revert changes if only line with date was changed
diff_lines = `git diff #{PATH::LANGUAGE_DAT}/language.dat* | egrep '^[+-](%|--) Generated' | wc -l`.strip
`git checkout HEAD -- #{PATH::LANGUAGE_DAT}/language.dat*` if diff_lines == '4'
