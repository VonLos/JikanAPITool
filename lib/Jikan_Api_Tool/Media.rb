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

end
