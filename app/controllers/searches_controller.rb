class SearchesController < ApplicationController

    def index
        queries = Search.all
        render json: queries
    end

    def create
        search = Search.new(search_params)
        # binding.pry
        result_object = Search.request(search.query)
        search.results = result_object

        # yalltube_links=video_ids.map{|name|"https://www.youtube.com/watch?v=#{name}"}
        # search.results = yalltube_links
        
        search.save!

        render json: search
    end

    # def results
    #     query = Search.find_by()
    #     render @current_results
    # end

    private

    def search_params
        params.require(:search).permit(:query, :results)
    end

end