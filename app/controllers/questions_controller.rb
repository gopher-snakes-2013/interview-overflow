class QuestionsController < ApplicationController

	def index
		@question = Question.new
		@questions = Question.order('votes DESC')
	end

	def create
		@question = Question.new(params[:question])
		if @question.save
			redirect_to root_path
		else
			render :index
		end
	end

	def show
		@question = Question.find(params[:id])
		@comment = Comment.new
	end

	def update
		question = Question.find(params[:id])
		question.votes += 1
		question.update_attribute(:votes,question.votes)
		render json: {votes: question.votes,id: question.id}
	end
end
