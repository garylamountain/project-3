class UsersController < ApplicationController

    def index
        users = User.all
        render json: users.to_json
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user.to_json
    end
    
    def update
        user = User.find_by(id: params[:id])
        user.update(liked_posts: params[:liked_posts], disliked_posts: params[:disliked_posts])
        render json: user.to_json
    end

    def create
        user = User.create(username: params[:username])
        render json: user.to_json
    end

end
