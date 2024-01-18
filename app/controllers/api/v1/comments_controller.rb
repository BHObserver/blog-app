class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def index
    comments = @post.comments
    render json: { comments: comments }
  end

  def create
    comment = @post.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      render json: { comment: comment }, status: :created
    else
      render json: { error: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
