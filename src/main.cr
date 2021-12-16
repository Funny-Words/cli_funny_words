require "funny_wrds"
require "option_parser"

def get_file(path = "../funny_words_json/words.json")
    FunnyWords.new path
end

OptionParser.parse do |parser|
    print "Enter path to json file: "
    funny_words = get_file(gets.not_nil!.to_s)

    parser.banner = "Welcome to the Funny Words"

    parser.on("-h", "--help") { puts parser; exit }

    parser.on("-g NUM", "--get=NUM") { |num| puts funny_words.get_words(num.to_i) }
    
    parser.on("-c", "--concatenated-words") { |num| puts funny_words.get_concatenated_words }

    parser.invalid_option do |flag|
        STDERR.puts "ERROR: #{flag} is not a valid option."
        STDERR.puts parser
        exit(1)
    end
end