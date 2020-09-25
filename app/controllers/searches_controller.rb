class SearchesController < ApplicationController

    def index
        queries = Search.all
        render json: queries
    end

    def create
        search = Search.new(search_params)
        # binding.pry
        # yalltube_links=video_ids.map{|name|"https://www.youtube.com/watch?v=#{name}"}
        search.results, next_token, prev_token =  Search.request(search.query, search.results)
        # binding.pry

        search.save!
        cats={search:search,token:next_token,prev:prev_token}
        # binding.pry
        render json: cats
    end

    private

    def search_params
        params.require(:search).permit(:query, :results)
    end

end