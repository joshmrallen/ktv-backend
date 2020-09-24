class Video < ApplicationRecord

    def self.search (query)
        key = ENV['API_KEY']
        response = RestClient.get("https://www.googleapis.com/youtube/v3/search?q=#{query}h&key=#{key}")
        result = JSON.parse(response.body)
    end
      
end
