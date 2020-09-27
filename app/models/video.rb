class Video < ApplicationRecord
has_many :favorites
has_many :users, through: :favorites

validates :url, uniqueness: true


    def self.search (query)
        key = ENV['API_KEY']
        response = RestClient.get("https://www.googleapis.com/youtube/v3/search?maxResults=10&q=#{query}h&key=#{key}")
        result = JSON.parse(response.body)
    end
      
end
