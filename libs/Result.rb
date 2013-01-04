class Result
	def Result.reader
		Dir.chdir("Results")
		savefilename = $savefilename
		read = File.open("#{savefilename}.xrsbxl2x", "r")
<<<<<<< HEAD
		puts read.readlines
=======
		puts read.readline
		puts read.readline
		puts read.readline
		puts read.readline
		puts read.readline
>>>>>>> 3f177042cedc2a5d5dcc0a6704d036d0777d3606
		gets
	end
end
