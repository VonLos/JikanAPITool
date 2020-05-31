
class Cli
    def starter
        menu
        end

        def menu
            input = nil
            until input == "exit"

            puts "Welcome, please choose an anime or manga to learn more about or type exit to end this session."
            input = gets.strip.downcase
            
            case input
            when "anime"
            puts  'Anime selected, please input the name you want to search.'
            anime_pull

            #run api method at this point and return info
            when "manga"
            puts 'Manga selected, please input the name you want to search. '
            manga_pull
            when "exit"
                closer
            else
            puts 'Invalid command, please choose type anime or manga to proceed. You may also select exit to end this session.'
            input = gets.strip.downcase
            end
            end
        end


        def closer
                puts "Thank you for using our service!"
        end
        
        def manga_pull
        type = 'manga'
        name = nil
        name = gets.strip.downcase
        puts "This is what we were able to find: "
        Api.new.edit_data(type, name) 
        end

        def anime_pull
        type = 'anime'
        name = nil
        name = gets.strip.downcase
        puts "This is what we were able to find: "
        Api.new.edit_data(type, name)
        binding.pry
        end


    end

