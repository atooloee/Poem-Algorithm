require 'matrix'
require 'tf-idf-similarity'
require 'set'

class CommandLineInterface

    @@line_array = []
    @@total_words = 0
    @@unique_words = {}
    @@unique_scores = {}
    @@line_scores = {}
    
    def run
        puts "Lepanto Line Finder"
        puts "\n"
        read_file
        greet
        puts "\n"
        find_closest_line
    end

    def greet
        puts "Can't remember a line from Lepanto? Enter what you do remember and we'll find it. \n"
    end

    def read_file
        line_num = 1
    # Read file 
        File.foreach( 'lepanto.txt' ) do |line|
            @@line_array.push(line)
            num_words_in_line = line.split.size
            words_in_line = line.split
            #update total words in document
            @@total_words = @@total_words + num_words_in_line
            #record all lines where each word appears
            words_in_line.each do |word| 
                if(!@@unique_words.key?(word)) 
                    @@unique_words.store(word, [line_num])
                else 
                   @@unique_words[word] << line_num
                end
            end
            line_num += 1
          end
          #assign each word a uniquness score
          @@unique_words.each do |word|
            arr = word[1]
            score = @@total_words / arr.size
            @@unique_scores.store(word[0], score)
          end
    end

    # def wrong_input
    #     puts "Please input at least 10 characters. We can't find what we don't know to look for. \n"
    # end

    def find_closest_line
        puts "Enter the words you remember."
        #get user inpput string
        input = gets.chomp
        #convert user string to array of words
        input_array = input.split
        lines_to_check = [] 
        #find all lines where user words appear
        input_array.each do |word|
            lines = @@unique_words[word]
            lines_to_check << lines

        end
        #consolidate all lines to check into a single array without duplicates
        lines_to_check = lines_to_check.flatten.uniq 

        #assign each possible line a relevance score
        lines_to_check.each do |line_num|
            #access line from poem (adjust for 0 indexing)
            line_contents = @@line_array[line_num -1].split
            #find the words presnt in the current poem line and user input
            common_words = input_array.intersection(line_contents)
            #assign the line a score and store in a hash
            line_score = 1
            common_words.each do |word|
                line_score = line_score * @@unique_scores[word]
                @@line_scores.store(line_num, line_score)
            end
        end
        #find the max score in @@line_scores and output associated line
        best_match_num = @@line_scores.key(@@line_scores.values.max)
        if best_match_num <= 54 
            puts "Your input was not specific enough to narrow it down to a specific line with high confidence, but it first occurs at line #{best_match_num}, which is: "
        else
            puts "Your best match is line #{best_match_num}, which is:"
        end
        puts @@line_array[best_match_num - 1]

        
    end
end