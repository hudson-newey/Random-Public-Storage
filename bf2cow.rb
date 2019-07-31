#!/usr/bin/env ruby
=begin
Copyright (C) 2018 Grathium Sofwares <grathiumsoftwears@gmail.com>
This program comes with ABSOLUTELY NO WARRANTY
This is a free software, and you are welcome to redistribute it under certain
conditions.
=end

$FileOut = ""
$i = 0
unwantedChar = ["+", "-", ">", "<", ",", ".", "[", "]"]
newChar = ["MoO", "MOo", "moO", "mOo", "oom", "Moo", "MOO", "moo"]

puts "File to Covert,"
$cowFile = gets.chomp
f = File.open($cowFile, "r")
f.each_line do |line|
  #replace charicters
  $i = 0
  while $i < unwantedChar.count do
    line.gsub!(unwantedChar[$i], newChar[$i])
    $i +=1
  end
  puts line
  $FileOut += line

end
f.close
#write the line to the out.txt file
open('out.cow', 'w') { |f|
  f.puts $FileOut
}
