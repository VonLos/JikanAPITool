class Media
attr_accessor :mal_id, :title, :rated, :synopsis
@@all = []
def initialize(mal_id= nil, title = nil, rated = nil, synopsis =nil)
@mal_id = mal_id
@title = title
@rated = rated
@synopsis = synopsis
@@all << self
end


def self.all
@@all
end

end
