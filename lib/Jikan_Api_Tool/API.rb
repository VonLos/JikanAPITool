
class Api
attr_accessor :type, :name
    @@all = []
    
    
    
   
    def get_data(type, name)
        url = "http://api.jikan.moe/v3/search/#{type}?q=#{name}&limit=3"
            #get data from jikan api for editing
            uri = URI.parse(url)
            response = Net::HTTP.get_response(uri)
            response.body
    end
    
    def edit_data(type, name)
        filtered_result = []
        #edit it down to desired information and save it
          data = JSON.parse(self.get_data(type, name))
          results = data.fetch("results")
          results.each do|result| 
          filtered_result << result.filter{|k,v| k == "mal_id" || k == "title" || k == "rated" || k == "synopsis"}
        end
        filtered_result.each {|fresult| fresult.each {|key, value| puts "#{key.capitalize}: #{value}"}}
    end


    def self.all
    @@all
    end

end