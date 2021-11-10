require "./core"
require "option_parser"

funny_words = FunnyWords.new

OptionParser.parse do |parser|
    parser.banner = "Welcome to the Funny Words"

    parser.on("-h", "--help") do 
        puts parser
        exit
    end

    parser.on("-g NUM", "--get=NUM") { |num| puts funny_words.get_words(num.to_i) }

    parser.invalid_option do |flag|
        STDERR.puts "ERROR: #{flag} is not a valid option."
        STDERR.puts parser
        exit(1)
    end

end