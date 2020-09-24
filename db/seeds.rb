require 'pry'
require 'dotenv'
require 'rest-client'

Dotenv.load



puts "johnny appleseed"

# abc = Video.search("spider")

search = Search.new(query: "spider")
raw_results = Search.request(search.query)
array = raw_results["items"].select{|result| result["id"]["videoId"]}
video_ids = array.map{|result| result["id"]["videoId"]}

search.results = video_ids.join(', ')

search.save!

binding.pry

puts "complete"


