class Holocaust

	def initialize(username, password)
		@gbot = Snooby::Client.new("#{username}, 0.1")
		@gbot.authorize!(username, password)
		dictionary = YAML.load_file(File.expand_path('../data/dictionary.yaml'))
		@dictionary = dictionary[:words]
		read_com
	end

	def read_com
		while true
		  @gbot.r('all').comments.each do |com|
		  	sr = com['subreddit']
			  	@com = com
			  	comment = com.body.to_s
			  	check_com(comment)
			end	
		  end
		end
	end

	def check_com(comment)
		mis_words = []
		comment = comment.split
		@dictionary.each do |misp, word|
			if comment.include?(misp)
				mis_words = mis_words << word
			end
		end
		correct_comment(mis_words)
	end

	def correct_com(words)
		if words.size > 1
			@com.reply("EDIT: words.. #{words.join("*, ")}*")
			puts @com.body
		elsif words.size == 1
			@com.reply("EDIT: word.. #{words[0]}*")
			puts @com.body
		end
	end

end
