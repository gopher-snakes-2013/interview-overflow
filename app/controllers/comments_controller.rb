class CommentsController < ApplicationController

	def create
    question = Question.find params[:question_id]
		@comment = question.comments.build(params[:comment])
		if @comment.save
			render json: { insightful_comment: render_to_string( partial: 'comment', locals: { comment: @comment }) }
		else
			render json: { error: @comment.errors.full_messages.join(", ")}, status: :uprocessable_entity
		end
	end

end
