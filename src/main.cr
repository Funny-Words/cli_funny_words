require "funny_wrds"
require "option_parser"

OptionParser.parse do |parser|
    print "Enter path to json file: "

    begin 
        funny_words = FunnyWords.new gets.not_nil!.to_s
    rescue err
        STDERR.puts err.message 
        exit 1
    end

    parser.banner = "Welcome to the Funny Words"

    parser.on("-h", "--help") { puts parser; exit }

    parser.on("-g NUM", "--get=NUM") { |num| puts funny_words.get_words(num.to_i) }
    
    parser.on("-c", "--concatenated-words") { |num| puts funny_words.get_concatenated_words }

    parser.invalid_option do |flag|
        STDERR.puts "ERROR: #{flag} is not a valid option."
        STDERR.puts parser
        exit 1
    end
end