class VideosController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        videos = Video.all
        render json: videos
    end

    def show
        video = Video.find(video_params)
        render json: video
    end

    def create
        video = Video.create_or_find_by(youTubeId: video_params)
        video.get_video_details
        render json: video
    end

    private

    def video_params
        params.require(:video).permit(:youTubeId)
    end
    
end
