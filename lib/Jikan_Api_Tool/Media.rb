class Media
attr_accessor :mal_id, :title, :rated, :synopsis, :url, :score
@@all = []

def initialize(mal_id= nil, title = nil, rated = nil, synopsis =nil, url =nil, score = nil)
@mal_id = mal_id
@title = title
@rated = rated
@synopsis = synopsis
@url = url
@score = score
@@all << self
end


def self.all
@@all
end

def out
puts "Mal ID Number: #{self.mal_id}\n"
puts "Title: #{self.title}\n"
puts "Rated: #{self.rated}\n"
puts "Synopsis: #{self.synopsis}\n"
puts "URL: #{self.url}\n"
puts "Score: #{self.score}\n\n\n"
end

end
