# require 'rubygems'
# gem 'google-api-client', '>0.7'
# require 'google-api-client'
# require 'trollop'
require 'pry'
require 'dotenv'
Dotenv.load



puts "johnny appleseed"

key = ENV['API_KEY']

# DEVELOPER_KEY = key
# YOUTUBE_API_SERVICE_NAME = 'youtube'
# YOUTUBE_API_VERSION = 'v3'

# def get_service
#     client = Google::APIClient.new(
#       :key => DEVELOPER_KEY,
#       :authorization => nil,
#       :application_name => $PROGRAM_NAME,
#       :application_version => '1.0.0'
#     )
#     youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
  
#     return client, youtube
# end
  
# def main
#     opts = Trollop::options do
#       opt :q, 'Search term', :type => String, :default => 'Google'
#       opt :max_results, 'Max results', :type => :int, :default => 25
#     end
  
#     client, youtube = get_service
  
#     begin
#       # Call the search.list method to retrieve results matching the specified
#       # query term.
#       search_response = client.execute!(
#         :api_method => youtube.search.list,
#         :parameters => {
#           :part => 'snippet',
#           :q => opts[:q],
#           :maxResults => opts[:max_results]
#         }
#       )
  
#       videos = []
#       channels = []
#       playlists = []
  
#       # Add each result to the appropriate list, and then display the lists of
#       # matching videos, channels, and playlists.
#       search_response.data.items.each do |search_result|
#         case search_result.id.kind
#           when 'youtube#video'
#             videos << "#{search_result.snippet.title} (#{search_result.id.videoId})"
#           when 'youtube#channel'
#             channels << "#{search_result.snippet.title} (#{search_result.id.channelId})"
#           when 'youtube#playlist'
#             playlists << "#{search_result.snippet.title} (#{search_result.id.playlistId})"
#         end
#       end
  
#       puts "Videos:\n", videos, "\n"
#       puts "Channels:\n", channels, "\n"
#       puts "Playlists:\n", playlists, "\n"
#     rescue Google::APIClient::TransmissionError => e
#       puts e.result.body
#     end
# end
  
#   main

require 'google/apis/drive_v2'

Drive = Google::Apis::DriveV2 # Alias the module
drive = Drive::DriveService.new
drive.authorization = key # See Googleauth or Signet libraries
# binding.pry

# Search for files in Drive (first page only)
files = drive.list_files(q: "title contains 'finances'")
files.items.each do |file|
  puts file.title
end

# Upload a file
metadata = Drive::File.new(title: 'My document')
metadata = drive.insert_file(metadata, upload_source: 'test.txt', content_type: 'text/plain')

# Download a file
drive.get_file(metadata.id, download_dest: '/tmp/myfile.txt')

# binding.pry

puts "complete"