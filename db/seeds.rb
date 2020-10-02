require 'pry'
require 'dotenv'
Dotenv.load

require 'rest-client'


puts "johnny appleseed"

# users="Joshie,Jimbo"
# users=users.split(",")
# users.each{|u|User.create(name:u, email:"#{u}@flat.com")}


video = Video.new(youTubeId: "caITRQWpBHs")
video2 = Video.new(youTubeId: "x3bDhtuC5yk")
video.get_video_details
video2.get_video_details
x=video.description
y=video2.description
video.lyrics=x
video2.lyrics=y
video.save!
video2.save!
# fav = Favorite.create(video_id: 1, user_id: 1)




binding.pry


puts User.count
puts Video.count
puts "complete"


