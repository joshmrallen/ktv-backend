class FavoritesController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        binding.pry
        user = User.find_by(email:params["user_id"]["email"])
        user_id=user.id
        fav = Favorite.new(params)
        # yalltube_links=video_ids.map{|name|"https://www.youtube.com/watch?v=#{name}"}
        
        # binding.pry
    end

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :video_id)
    end

end
