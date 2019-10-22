class CommentsController < ApplicationController

    def index
        comments = Comment.all
        render json: comments.to_json
    end

    def show
        comment = Comment.find_by(id: params[:id])
        render json: comment.to_json
    end

    def create
        user = User.find_by(id: params[:user][:id])
        post = Post.find_by(id: params[:post][:id])
        comment = Comment.create(content: params[:content], user: user, post: post)
        render json: comment.to_json
    end

end
