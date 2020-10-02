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
        if(video.lyrics == nil)
            video.get_video_details
            render json: video
        else
            render json: video
        end
    end

    private

    def video_params
        params.require(:video).permit(:youTubeId)
    end
    
end
