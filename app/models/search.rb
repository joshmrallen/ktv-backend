
Dotenv.load

class Search < ApplicationRecord

    def self.request(query, previous_page=nil, next_page=nil)
        result_object={
            videos: "",
            current_page_token: "",
            next_page_token: "",
            previous_page_token: ""
        }

        key = ENV['API_KEY']
           
        
        if (previous_page!=nil)
            raw_results = api_call(query, previous_page)
            array = raw_results["items"].select{|result| result["id"]["videoId"]}
            result_object["videos"]= video_ids = array.map{|result| result["id"]["videoId"]}
            result_object["next_page_token"]=raw_results["nextPageToken"]
            result_object["previous_page_token"]=raw_results["prevPageToken"]
        elsif (next_page!=nil)
            raw_results = api_call(query, next_page)
            array = raw_results["items"].select{|result| result["id"]["videoId"]}
            result_object["videos"]= video_ids = array.map{|result| result["id"]["videoId"]}
            result_object["next_page_token"]=raw_results["nextPageToken"]
            result_object["previous_page_token"]=raw_results["prevPageToken"]
        else
            response = RestClient.get("https://www.googleapis.com/youtube/v3/search?maxResults=10&q=#{query}&type=video&key=#{key}")
            raw_result = JSON.parse(response.body)
            array = raw_results["items"].select{|result| result["id"]["videoId"]}
            video_ids = array.map{|result| result["id"]["videoId"]}
            result_object["next_page_token"]=raw_results["nextPageToken"]
        end 
        result_object.to_json
    end

    def api_call(query, token)
        key = ENV['API_KEY']
        response = RestClient.get("https://www.googleapis.com/youtube/v3/search?maxResults=10&&pageToken=#{token}&q=#{query}&type=video&key=#{key}")
        raw_result = JSON.parse(response.body)
    end

    # https://www.googleapis.com/youtube/v3/search?maxResults=10&q=jennifer&type=video&key=

end