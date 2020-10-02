class FavoritesController < ApplicationController
    skip_before_action :authorized, only: [:create, :destroy]

    def create
        # binding.pry
        user = User.find_by(email:params["user_id"]["email"])
        user_id=user.id
        already_in_system = Video.find_by(youTubeId: params["video_id"]) #params["video_id"] here is actually the youtube id for the video
        if already_in_system 
            Favorite.create!(user_id:user_id,video_id:already_in_system.id)
            render json: user
        else
            
            # binding.pry
            
            video = Video.new(youTubeId: params["video_id"]) #params["video_id"] here is actually the youtube id for the video
            video.get_video_details
            Favorite.create!(user_id:user_id,video_id:video.id)
            render json: video
        end
    end

    def destroy
        video = Video.find_by(youTubeId: params["video_id"]) #params["video_id"] here is actually the youtube id for the video
        favorite = Favorite.find_by(user_id: params["user_id"], video_id: video.id)
        favorite.destroy
        render json: { message: "Favorite deleted: #{video.title}" }
    end

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :video_id)
    end

end
