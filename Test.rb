# Programmed by Uche Okwo
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
    adir = Dir.pwd
	Dir.chdir("Saves")
    puts "What do you want the filename to be? This is used to load it."
    filename = gets.to_s.chomp
    puts "What do you want the result file name to be?"
	$savefilename = gets.to_s.chomp
    savegame = File.new("#{filename}.rsbxl2", "w")
	Dir.chdir(adir)
	Dir.chdir("lib")
	questemp = File.open("questions.rsbin2", "r")
	questemp.readline
	test_name = questemp.readline.to_s
	Dir.chdir(adir)
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
	 test_name = savedgame.readline.to_i
	 $savefilename = savedgame.readline.to_s
	 puts "Load Successful."
	 savedgame.close
	 Dir.chdir(adir)
	 Test.start_game
  end
end
module Error
 def Error.throw
	exit
end
end
module Check
 def Check.depend
   adir = Dir.pwd
   Dir.chdir("lib")
   if File.exists?("questions.rsbin2")
     if File.exists?("answers.rsbin2")
	 $questions = File.open("questions.rsbin2", "r")
	 $answers = File.open("answers.rsbin2", "r")
	 $runthisa = $questions.readline.to_i
	 $testname = $questions.readline.to_s
	 else
	 end
   else
   end
   Dir.chdir(adir)
  end
end  
module Init
  def Init.run
    correct = 0
	incorrect = 0
	runthisa = $runthisa
    runthisa.times do
      question = $questions.readline.to_s
	  answer1 = $questions.readline.to_s
	  answer2 = $questions.readline.to_s
	  answer3 = $questions.readline.to_s
	  answer4 = $questions.readline.to_s
      puts question
	  puts "1 = #{answer1}"
	  puts "2 = #{answer2}"
	  puts "3 = #{answer3}"
	  puts "4 = #{answer4}"
	  puts "What is your answer?"
      $youranswer = gets.to_i
	  $correctanswer = $answers.readline.to_i
      if $youranswer == $correctanswer
		 correct = correct + 1
      else
		 incorrect = incorrect + 1
	  end
	end
	@@correct = correct
	@@incorrect = incorrect
	Init.check
	end
  def Init.check
    adir = Dir.pwd
    Dir.chdir("Results")
    result = File.new("#{$savefilename}.xrsbxl2x", "w")
	result.puts("Correct: #{@@correct}")
	result.puts("Incorrect: #{@@incorrect}")
	result.puts("Name: #{$name}")
	result.puts("Age: #{$age}")
	result.puts("Name of test: #{$testname}")
	result.close
	puts "Do you want to view your results? Y=Yes N=No"
	getin = gets.to_s.chomp
	Dir.chdir(adir)
	if getin == "Y"
	 Result.reader
	else
	end
  end
end
class Result
  def Result.reader
   adir = Dir.pwd
   Dir.chdir("Results")
   savefilename = $savefilename
   read = File.open("#{savefilename}.xrsbxl2x", "r")
   puts read.readline
   puts read.readline
   puts read.readline
   puts read.readline
   puts read.readline
   gets
   end
  end

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