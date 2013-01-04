class Writer
 def setup
   if File.exists?("questions.rsbin2")
     if File.exists?("answers.rsbin2")
	   @@question = File.open("questions.rsbin2", "a")
	   @@answer = File.open("answers.rsbin2", "a")
	   Writer.write
	 end
   end
  end
  def Writer.write
    puts "What is the question?"
	question = gets.to_s.chomp
	@@question.puts("#{question}")
	puts "What are your four answers?"
	answer1 = gets.to_s.chomp
	answer2 = gets.to_s.chomp
	answer3 = gets.to_s.chomp
	answer4 = gets.to_s.chomp
	@@question.puts("#{answer1}")
	@@question.puts("#{answer2}")
	@@question.puts("#{answer3}")
	@@question.puts("#{answer4}")
	puts "What is the correct answer?"
	canswer = gets.to_i
	if canswer < 5
	  if canswer > 0
	    @@answer.puts("#{canswer}")
		yes = 1
	  else
	   puts "Error: Will now terminate"
	  end
	else
	  puts "Error: Will now terminate"
	end
	if yes == 1
	  puts "You have written the question. Do you want to write another? 1 = Yes 2 = No"
	  answered = gets.to_i
	  if answered == 1
	    Writer.write
	  elsif answered == 2
	  else
	  end
    else
	end
  end
end
Editor = Writer.new
puts "Remeber to edit the number of questions in the file manually!"
Editor.setup
