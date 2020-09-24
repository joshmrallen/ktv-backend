require 'pry'
require 'dotenv'
Dotenv.load

require 'rest-client'



puts "johnny appleseed"


# def search (query)
#     key = ENV['API_KEY']
#     response = RestClient.get("https://www.googleapis.com/youtube/v3/search?maxResults=10&q=#{query}h&key=#{key}")
#     result = JSON.parse(response.body)
# end

# testdata = search("spider")
# binding.pry

abc = Video.search("spider")

binding.pry

puts "complete"

