
class Api

    def get_data(name)
        url = "http://api.jikan.moe/v3/search/anime?q=#{name}&limit=3"
            #get data from jikan api for editing
            uri = URI.parse(url)
            response = Net::HTTP.get_response(uri)
            response.body
    end
    
    def edit_data(name)
          filtered_result = []
          mal_id = ''
          title =  ''
          rated = ''
          synopsis = ''
          url = ''
          score = ''
        #edit it down to desired information and save it
            data = JSON.parse(self.get_data(name))
             data.fetch("results") != nil
            results = data.fetch("results")
            results.each do|result| 
            mal_id = result["mal_id"] 
            title = result["title"]
            rated = result["rated"]
            synopsis = result["synopsis"]
            url = result["url"]
            score = result["score"]
            Media.new(mal_id,title,rated, synopsis, url, score)
            end
    end

end