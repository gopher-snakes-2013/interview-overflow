class QuestionsController < ApplicationController

	def index
		@question = Question.new
		# if you're always sorting by votes, then move it to the model as a default order.
		@questions = Question.order('votes DESC')
	end

	def create
		@question = Question.new(params[:question])
		if @question.save
			redirect_to root_path
		else
			@questions = Question.order('votes DESC')
			render :index
		end
	end

	def show
		@question = Question.find(params[:id])
		@comment = Comment.new
	end

	def update
		question = Question.find(params[:id])
		question.vote!
		render json: {votes: question.votes,id: question.id}
	end
end
