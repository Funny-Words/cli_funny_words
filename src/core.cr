require "json"

class FunnyWords
	@words : JSON::Any

    def initialize(@path_to_words : String)
    	@words = File.open(@path_to_words) { |file| JSON.parse(file) }
	end

    def get_words(n = 1)
        @words.as_a.sample(n)
    end

end