#!/usr/bin/ruby -w

# print array with 4 elements per line

the_array = [1234, 123.4, 12.34, 1.234, 0.1234, 1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9, 0xA, 0xB]
line_length = 4

puts '- using just "each": '
counter = 0
the_array.each do |x|
  print "#{x} "
  puts if (counter = counter + 1) % line_length == 0
end 
puts

puts '- using "each_slice": '
the_array.each_slice(line_length) { |slice| slice.each { |x| print "#{x} "} ; puts ''  }
