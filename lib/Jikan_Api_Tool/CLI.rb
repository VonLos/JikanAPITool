
class Cli
        
    def start
        puts "Welcome, please enter an anime name to search for more info or type exit to end this session."
        menu
    end

    def menu
        input = gets.strip.downcase
        if input.length <= 3 
            puts "Please use 3 characters or more."
            menu
        elsif input == "exit"
            closer
        else 
            puts "This is what we were able to find:"
            name = input
            anime_pull(input)
        end
    end
        
    def anime_pull(input)
        Api.new.edit_data(input)
        Media.all.each {|result| puts result.title}
        puts "Pick one you would like to know more about or type exit."
        input = gets.strip.downcase
        if input == "exit"
        closer
        else
        title_out(input)
        end
    end
    def title_out(input)
        out = Media.all.detect{|result| result.title.downcase == input}
        puts "Mal ID Number: #{out.mal_id}\n"
        puts "Title: #{out.title}\n"
        puts "Rated: #{out.rated}\n"
        puts "Synopsis: #{out.synopsis}\n"
        puts "URL: #{out.url}\n"
        puts "Score: #{out.score}.score\n\n\n"
        puts "Would you like to continue or exit? Type yes to search again or any other key to exit."
        input = gets.strip.downcase
        if input == "yes" || input == "y"
        self.start
        else
        closer
        end
    end
     
     
    def   self.no_results
        puts "No results found please type the name again:"
        start
    end

    def closer
        puts "Thank you for using our service!"
    end
end

