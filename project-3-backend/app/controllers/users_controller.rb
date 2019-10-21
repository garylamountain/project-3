class UsersController < ApplicationController

    def index
        users = User.all
        render json: users.to_json
    end
    
    def create
        user = User.create(username: params[:username])
        render json: user.to_json
    end

end
