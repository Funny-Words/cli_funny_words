require "json"

class FunnyWords
	@words : JSON::Any

    def initialize()
    	@words = File.open("./words/words.json") { |file| JSON.parse(file) }
	end

    def get_words(n = 1)
        @words.as_a.sample(n)
    end

end