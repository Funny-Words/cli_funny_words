require "funny_wrds"
require "option_parser"

print "Enter path to json file: "
funny_words = FunnyWords.new(gets.to_s)

OptionParser.parse do |parser|
    parser.banner = "Welcome to the Funny Words"

    parser.on("-h", "--help") do 
        puts parser
        exit
    end

    parser.on("-g NUM", "--get=NUM") do |num| 
        puts funny_words.get_words(num.to_i)  
    end

    #parser.on("-c", "--concatenated-words") do |num|
    #    puts funny_words.get_concatenated_words
    #end

    parser.invalid_option do |flag|
        STDERR.puts "ERROR: #{flag} is not a valid option."
        STDERR.puts parser
        exit(1)
    end
end