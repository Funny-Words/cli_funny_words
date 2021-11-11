require "funny_wrds"
require "option_parser"

OptionParser.parse do |parser|
    parser.banner = "Welcome to the Funny Words"

    parser.on("-h", "--help") do 
        puts parser
        exit
    end

    parser.on("-g NUM", "--get=NUM") do |num| 
        print "Enter path to json file: "
        funny_words = FunnyWords.new(gets.to_s) # path to name.json that contains words 
        puts funny_words.get_words(num.to_i) 
    end # NUM is a number of words

    parser.invalid_option do |flag|
        STDERR.puts "ERROR: #{flag} is not a valid option."
        STDERR.puts parser
        exit(1)
    end
end