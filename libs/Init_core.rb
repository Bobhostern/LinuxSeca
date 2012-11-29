$LOAD_PATH << "."

require 'Result.rb'

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
		Dir.chdir("..")
		if getin == "Y"
			Result.reader
		else
		end
	end
end