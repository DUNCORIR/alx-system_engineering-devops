#!/usr/bin/env ruby
input = ARGV[0]
if input.match(/^\d{10}$/)
  puts input
else
  puts "No match found"
end
