#!/usr/bin/env ruby

def camelize(lower_case_and_underscored_word, first_letter_in_uppercase = true)
  if first_letter_in_uppercase
    lower_case_and_underscored_word.to_s.gsub(/\/(.?)/) { "::" + $1.upcase }.gsub(/(^|_|-)(.)/) { $2.upcase }
  else
    lower_case_and_underscored_word.first + camelize(lower_case_and_underscored_word)[1..-1]
  end
end

def replace(filename, pname, cap_pname)
	contents = File.read(filename)
	contents = contents.gsub(/GrsTemplate/, cap_pname)
	contents = contents.gsub(/grs-template/, pname)
	File.write(filename, contents)
end

if !ARGV[0]
	puts "USAGE: curl https://raw.githubusercontent.com/davidsiaw/grs-template/master/grs.rb | ruby -- - <project-name>"
	exit
end

pname = ARGV[0]
cap_pname = camelize(ARGV[0])

#puts pname
#puts cap_pname

curdir = `pwd`.chomp

puts "Downloading template..."
puts `wget --no-check-certificate https://github.com/davidsiaw/grs-template/archive/master.tar.gz`
puts `tar xvf master.tar.gz`
puts `rm master.tar.gz`
puts `mv grs-template-master #{pname}`

puts "Setting up"
replace("#{curdir}/#{pname}/config/initializers/session_store.rb", pname, cap_pname)
replace("#{curdir}/#{pname}/app/views/layouts/application.html.erb", pname, cap_pname)
replace("#{curdir}/#{pname}/config/application.rb", pname, cap_pname)

puts "Done."
