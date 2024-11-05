#!/usr/bin/env ruby

input = ARGV[0]
match_data = input.match(/from:([A-Za-z0-9\+]+)\] \[to:([A-Za-z0-9\+]+)\] \[flags:([-\d:]+)\]/)

if match_data
  sender = match_data[1]
  receiver = match_data[2]
  flags = match_data[3]

  puts "#{sender},#{receiver},#{flags}"
else
  puts "No match found"
end
