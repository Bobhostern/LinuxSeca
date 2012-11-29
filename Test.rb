#!/usr/bin/ruby -w

#Programmed by Bob Hostern

$LOAD_PATH << "./libs"

require 'Test_core.rb'

puts "Are you new? Y = Yes N = No"
answer = gets.to_s.chomp
if answer == "Y"
  puts "What is your name?"
  name = gets.to_s.chomp
  puts "What age?"
  age = gets.to_i
  Game = Test. new(name,age)
  Game.main_menu
elsif answer == "N"
 Game = Test. new("Nil","Nil")
 Test.load_game
else
 Error.throw
end
Read = Result.new