
class Cli
    attr_accessor :input
        def starter
        menu
        end

        def menu
            input = nil
            puts "Welcome, please enter an anime name to search for more info or type exit to end this session."
            input = gets.strip.downcase
            until input == "exit" && input.length >= 3
            if input.length >= 3 && input != "exit"
                anime_pull(input)
            elsif input == "exit"
                closer
            else puts "Must have a minimum of 3 characters to search."
                input = gets.strip.downcase
            end
            end
        end


        def anime_pull(input)
        Api.new.edit_data(input)
        Media.all.each {|result| puts result.title}
        puts "Pick one you would like to know more about or type exit."
        input = gets.strip.downcase
        end

        def title_out
           puts  Media.all.detect {|result| result.title === input.downcase}
        end
     
     
        def   self.no_results
        puts "No results found please type the name again:"
        menu
        end

        def closer
        puts "Thank you for using our service!"
        end
end

