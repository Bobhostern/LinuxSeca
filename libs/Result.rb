class Result
	def Result.reader
		Dir.chdir("Results")
		savefilename = $savefilename
		read = File.open("#{savefilename}.xrsbxl2x", "r")
		puts read.readlines
		puts read.readline
		puts read.readline
		puts read.readline
		puts read.readline
		puts read.readline
		gets
	end
end
