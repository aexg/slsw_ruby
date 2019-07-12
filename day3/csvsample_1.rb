#!/usr/bin/ruby -w

class ActsAsCsv

    def read
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(/\s*,\s*/)
      file.each do |row|
          @result << row.chomp.split(/\s*,\s*/)
      end
    end
  
    def headers
      @headers
    end
  
    def csv_contents
      @result
    end
  
    def initialize
      @result = []
      read
    end
end
    
class RubyCsv < ActsAsCsv
end
    
m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
  
