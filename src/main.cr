require "./core"
require "option_parser"

print "Enter path to json file: "
funny_words = FunnyWords.new(gets.to_s) # path to name.json that contains words 

OptionParser.parse do |parser|
    parser.banner = "Welcome to the Funny Words"

    parser.on("-h", "--help") do 
        puts parser
        exit
    end

    parser.on("-g NUM", "--get=NUM") { |num| puts funny_words.get_words(num.to_i) } # NUM is a number of words

    parser.invalid_option do |flag|
        STDERR.puts "ERROR: #{flag} is not a valid option."
        STDERR.puts parser
        exit(1)
    end
end