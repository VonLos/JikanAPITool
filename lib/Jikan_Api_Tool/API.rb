
class Api

    def get_data(name)
        url = "http://api.jikan.moe/v3/search/anime?q=#{name}&limit=5"
        #get data from jikan api for editing
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
    end
    
    def edit_data(name)
        filtered_result = {}
        #edit it down to desired information and save it
        data = JSON.parse(self.get_data(name))
        results = data.fetch("results")
        results.each do|result| 
        filtered_result[:mal_id] = result["mal_id"] 
        filtered_result[:title] = result["title"]
        filtered_result[:rated ]= result["rated"]
        filtered_result[:synopsis] = result["synopsis"]
        filtered_result[:url] = result["url"]
        filtered_result[:score]= result["score"]
         Media.new(filtered_result)
        end
    end

end