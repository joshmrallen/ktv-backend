require 'pry'
require 'dotenv'
Dotenv.load

require 'rest-client'


puts "johnny appleseed"

# users="Joshie,Jimbo"
# users=users.split(",")
# users.each{|u|User.create(name:u, email:"#{u}@flat.com")}

# videos="x3bDhtuC5yk,caITRQWpBHs"
# videos=videos.split(",")
# videos.each{|v|Video.create(name:"song", lyrics:"none",url:v)}

# binding.pry


puts User.count
puts Video.count
puts "complete"


