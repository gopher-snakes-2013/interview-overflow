class CommentsController < ApplicationController

	def create
		p params
		@comment = Comment.new(params[:comment])
		@comment.question_id = params[:question_id]
		if @comment.save
			render :json => {:insightful_comment => render_to_string( :partial => 'comment', :locals => { :comment => @comment})}
		else

		end
	end

end