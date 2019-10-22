class LikesController < ApplicationController

    def index
        likes = Like.all
        render json: likes.to_json
    end

    def create
        user = User.find_by(id: params[:user][:id])
        post = Post.find_by(id: params[:post][:id])
        like = Like.create(user: user, post: post)
        render json: like.to_json
    end

    def destroy
        like = Like.find_by(id: params[:id])
        like.destroy
    end

end
