class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts.to_json(:include => :comments)
    end

    def show
        post = Post.find_by(id: params[:id])
    end

end
