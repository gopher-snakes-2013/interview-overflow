class CommentsController < ApplicationController

	def create
		@comment = Comment.new(params[:comment])
		@comment.question_id = params[:question_id]
		if @comment.save
			render json: { insightful_comment: render_to_string( partial: 'comment', locals: { comment: @comment }) }
		else
			render json: { error: @comment.errors.full_messages.join(", ")}, status: :uprocessable_entity
		end
	end

end