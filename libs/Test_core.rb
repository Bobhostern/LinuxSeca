$LOAD_PATH << "."

require 'Check.rb'
require 'Error.rb'
require 'Init_core.rb'

class Test
	def initialize(name, age)
		$name = name
		$age = age
	end
	def main_menu
		puts "Do you want to save a profile or start a test? SaP = Save StT = Start"
		choice = gets.to_s.chomp
		if choice == "SaP"
			Test.savegame
		elsif choice == "StT"
			Test.start_game
		else
			Error.throw
		end
	end
	def Test.savegame
		Dir.chdir("Saves")
		puts "What do you want the filename to be? This is used to load it."
		filename = gets.to_s.chomp
		puts "What do you want the result file name to be?"
		$savefilename = gets.to_s.chomp
		savegame = File.new("#{filename}.rsbxl2", "w")
		Dir.chdir("..")
		Dir.chdir("lib")
		questemp = File.open("questions.rsbin2", "r")
		questemp.readline
		test_name = questemp.readline.to_s
		Dir.chdir("..")
		savegame.puts("#{$name}")
		savegame.puts("#{$age}")
		savegame.puts("#{test_name}")
		savegame.puts("#{$savefilename}")
		puts "Do you wish to continue? Y = Yes N = No"
		inputt = gets.to_s.chomp
		if inputt == "Y"
			Test.start_game
		elsif inputt == "N"
		else
			Error.throw
		end
	end
	def Test.start_game
		puts "You wish to start."
		puts "Checking dependencies..."
		Check.depend
		puts "Initializing..."
		Init.run
	end
	def Test.load_game
		adir = Dir.pwd
		Dir.chdir("Saves")
		puts "What is the filename?"
		name = gets.to_s.chomp
		savedgame = File.open("#{name}.rsbxl2", "r")
		$name = savedgame.readline.to_s
		$age = savedgame.readline.to_i
		$test_name = savedgame.readline.to_i
		$savefilename = savedgame.readline.to_s
		puts "Load Successful."
		savedgame.close
		Dir.chdir(adir)
		Test.start_game
	end
end