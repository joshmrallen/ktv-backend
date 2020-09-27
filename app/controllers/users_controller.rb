class UsersController < ApplicationController

    def index
        users = User.all
        render json: users, except: [:created_at, :updated_at]
    end

    def show
        user=User.find_by(id: params[:id])
        if user
            render json: user.to_json(:include => {
                :favorites => {:only => [:created_at,:video_id]},
                :videos => {:except => [:created_at,:updated_at]}
            }, :except => [:created_at,:updated_at])
        else
            render json: { message: 'member not found' }
        end
    end

    def create
        user=User.create!(user_params)
        render json: user
    end

    def user_params
        params.require(:user).permit(:name,:email,:age)
    end

end
