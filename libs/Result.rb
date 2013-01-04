class Result
	def Result.reader
		Dir.chdir("Results")
		savefilename = $savefilename
		read = File.open("#{savefilename}.xrsbxl2x", "r")
		puts read.readlines
		gets
	end
end
