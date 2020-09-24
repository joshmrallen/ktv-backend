
Dotenv.load

class Search < ApplicationRecord

    def self.request(query)
        key = ENV['API_KEY']
        # binding.pry
        response = RestClient.get("https://www.googleapis.com/youtube/v3/search?maxResults=10&q=#{query}h&key=#{key}")
        result = JSON.parse(response.body)
    end

end