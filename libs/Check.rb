module Check
	def Check.depend
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
		Dir.chdir("..")
	end
end  