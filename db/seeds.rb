require 'pry'
require 'dotenv'
Dotenv.load
# require 'google-api-client'
require 'google/apis'
require 'google/apis/youtube_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'Trollop'


puts "johnny appleseed"

key = ENV['API_KEY']
YOUTUBE_SCOPE = 'https://www.googleapis.com/auth/youtube'


def get_authenticated_service

  youtube = Google::Apis::YoutubeV3::YouTubeService.new
  scope = Google::Apis::YoutubeV3::AUTH_YOUTUBE_READONLY

  binding.pry
  file_storage = Google::APIClient::FileStorage.new("#{$PROGRAM_NAME}-oauth2.json")
  if file_storage.authorization.nil?
    client_secrets = Google::APIClient::ClientSecrets.load
    flow = Google::APIClient::InstalledAppFlow.new(
      :client_id => client_secrets.client_id,
      :client_secret => client_secrets.client_secret,
      :scope => [YOUTUBE_SCOPE]
    )
    client.authorization = flow.authorize(file_storage)
  else
    client.authorization = file_storage.authorization
  end

  return client, youtube
end

def main
  opts = Trollop::options do
    opt :channel_id, 'ID of the channel to subscribe to.', :type => String,
          :default => 'UCtVd0c0tGXuTSbU5d8cSBUg'
  end

  client, youtube = get_authenticated_service

  begin
    body = {
      :snippet => {
        :resourceId => {
          :channelId => opts[:channel_id]
        }
      }
    }

    # Call the API's youtube.subscriptions.insert method to add the subscription
    # to the specified channel.
    subscriptions_response = client.execute!(
      :api_method => youtube.subscriptions.insert,
      :parameters => {
        :part => body.keys.join(',')
      },
      :body_object => body
    )

    puts "A subscription to '#{subscriptions_response.data.snippet.title}' was added."
  rescue Google::APIClient::TransmissionError => e
    puts e.result.body
  end
end

main


binding.pry

puts "complete"