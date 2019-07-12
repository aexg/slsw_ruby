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

class CsvRow

  attr_accessor :data

  def initialize(row, headers)
    @data = row
    @headers = headers
  end

  def method_missing(name, *args, &block)
    if ( ix = @headers.index(name.to_s) )
      return @data[ix]
    else
      return "<error: column \"#{name.to_s}\" not found>"
    end
  end
end


class RubyCsv < ActsAsCsv

  def each
    @result.each { |x| yield CsvRow.new(x, @headers)  }
  end

end
  
m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each { |row| puts row.username }

