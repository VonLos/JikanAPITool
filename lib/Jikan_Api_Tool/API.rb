
class Api
    def get_data(type, name)
        url = "http://api.jikan.moe/v3/search/#{type}?q=#{name}&limit=3"
            #get data from jikan api for editing
            uri = URI.parse(url)
            response = Net::HTTP.get_response(uri)
            response.body
    end
    
    def edit_data(type, name)
          filtered_result = []
          mal_id = ''
          title =  ''
          rated = ''
          synopsis = ''
        #edit it down to desired information and save it
          data = JSON.parse(self.get_data(type, name))
          results = data.fetch("results")
          results.each do|result| 
            mal_id = result["mal_id"] 
            title = result["title"]
            rated = result["rated"]
            synopsis = result["synopsis"]
            Media.new(mal_id,title,rated, synopsis)
            binding.pry
          end

    end

    def self.all
    @@all
    end

end