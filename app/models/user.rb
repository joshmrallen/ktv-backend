class User < ApplicationRecord
has_many :favorites
has_many :videos, through: :favorites

validates :name, presence: true
validates :email, uniqueness: true 

end



#Video instance creation scenarios:
#   when a user selects a video to watch
#   when a user likes/favorites a video (but hasn't watched)    

#Show last 5 videos created by using Video.last.five