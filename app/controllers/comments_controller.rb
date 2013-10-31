class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @comment.question_id = params[:question_id]
    @comment.save
    redirect_to root_path
  end

end