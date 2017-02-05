class Review < ActiveRecord::Base
    has_many :reviewreplies
    
end
