class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
    end

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
        @user = User.create!(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'Failed to create user' }, status: :not_acceptible
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
