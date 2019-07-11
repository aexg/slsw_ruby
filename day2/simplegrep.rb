#!/usr/bin/ruby -w

# simple grep, example of usage: ./simplegrep.rb loremipsum.txt "int[a-z]ger"

line_count = 1
File.open(ARGV[0]).each do |line|
  print line_count, ': ', line if line =~ /#{ARGV[1]}/
  line_count += 1
end
