class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @comment.question_id = params[:question_id]
    @comment.save
    redirect_to question_path(params[:question_id])
  end

end