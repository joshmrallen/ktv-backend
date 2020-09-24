class SearchesController < ApplicationController

    def index
        queries = Search.all
        render json: queries
    end

    def create
        search = Search.new(search_params)
        # binding.pry
        raw_results = Search.request(search.query)
        array = raw_results["items"].select{|result| result["id"]["videoId"]}
        video_ids = array.map{|result| result["id"]["videoId"]}

        search.results = video_ids.join(', ')
        
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