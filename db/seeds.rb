require 'pry'
require 'dotenv'
Dotenv.load
require 'google/apis'
require 'google/apis/youtube_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'rest-client'



puts "johnny appleseed"




abc = Video.search("spider")

binding.pry

puts "complete"

