class Api::V1::CommentsController < ApplicationController
  def index
    comments = Comment.all

    render json: comments
  end

  def show
    comment = Comment.find(params[:id])

    render json: comment
  end

  private 

  def comment_params
    params.require(:comment).permit(:description, :commentor, :issue_id)
  end
end
