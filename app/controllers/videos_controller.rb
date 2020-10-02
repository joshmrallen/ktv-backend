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
        already_in_system = Video.find_by(youTubeId: video_params[:youTubeId])
        if !!already_in_system == false
            video = Video.new(youTubeId: video_params[:youTubeId])
            video.get_video_details
            render json: video
        else
            render json: already_in_system
        end
    end

    private

    def video_params
        params.require(:video).permit(:youTubeId)
    end
    
end
