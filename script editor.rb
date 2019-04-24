#!/usr/bin/env ruby
=begin
Labyrinth Copyright (C) 2018 Grathium Sofwares <grathiumsoftwears@gmail.com>
This program comes with ABSOLUTELY NO WARRANTY
This is a free software, and you are welcome to redistribute it under certain
conditions.
=end

$FileOut = ""
$i = 0
unwantedChar = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "\n"]
f = File.open("script.txt", "r")
f.each_line do |line|
  line = line.downcase

  #replace charicters
  $i = 0
  while $i < unwantedChar.count do
    line.gsub!(unwantedChar[$i], "")
    $i +=1
  end
  puts line
  $FileOut += line

end
f.close
#write the line to the out.txt file
open('out.txt', 'w') { |f|
  f.puts $FileOut
}
