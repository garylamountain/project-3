class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts.to_json(:include => [:comments, :user])
    end

    def show
        post = Post.find_by(id: params[:id])
    end

    def update
        post = Post.find_by(id: params[:id])
        post.update(likes: params[:likes])
        render json: post.to_json(:include => :comments)
    end

    def create
        user = User.find_by(id: params[:user][:id])
        post = Post.create(src: params[:src], caption: params[:caption], likes: params[:likes], user: user)
        p post
        render json: post.to_json
    end

end
