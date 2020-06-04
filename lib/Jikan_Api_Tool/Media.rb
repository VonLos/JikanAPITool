class Media
    attr_accessor :mal_id, :title, :rated, :synopsis, :url, :score
    @@all = []  

    def initialize(media_hash)
        media_hash.each{|k,v| self.send("#{k}=", v)}
        @@all << self
    end
    

    def self.all
    @@all
    end

end
