class FavoritesController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        # binding.pry
        user = User.find_by(email:params["user_id"]["email"])
        user_id=user.id
        video = Video.new(youTubeId:params["video_id"])
        video.get_video_details
        video.save!
        video_id=video.id
        fav = Favorite.create!(user_id:user_id,video_id:video.id)
        render json: fav
    end

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :video_id)
    end

end
