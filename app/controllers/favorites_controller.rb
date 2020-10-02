class FavoritesController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        # binding.pry
        user = User.find_by(email:params["user_id"]["email"])
        user_id=user.id
        already_in_system = Video.find_by(youTubeId: params["video_id"])
        if already_in_system 
            Favorite.create!(user_id:user_id,video_id:already_in_system.id)
            render json: user
        else
            
            # binding.pry
            
            video = Video.new(youTubeId: video_params[:youTubeId])
            video.get_video_details
            Favorite.create!(user_id:user_id,video_id:video.id)
            render json: user
        end
    end

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :video_id)
    end

end
