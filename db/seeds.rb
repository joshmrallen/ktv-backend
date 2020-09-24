require 'pry'
require 'dotenv'
Dotenv.load
require 'google/apis'
require 'google/apis/youtube_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'rest-client'



puts "johnny appleseed"

key = ENV['API_KEY']
response = RestClient.get("https://www.googleapis.com/youtube/v3/search?q=josh&key=#{key}")
result = JSON.parse(response.body)





binding.pry

puts "complete"

