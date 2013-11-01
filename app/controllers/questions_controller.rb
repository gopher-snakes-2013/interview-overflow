class QuestionsController < ApplicationController

	def index
		@question = Question.new
		@questions = Question.order('votes DESC')
	end

	def create
		Question.create(params[:question])
		redirect_to root_path
	end

	def show
		@question = Question.find(params[:id])
		@comment = Comment.new
	end

	def update
		question = Question.find(params[:id])
		question.votes += 1
		question.update_attribute(:votes,question.votes)
		redirect_to root_path
	end
end
