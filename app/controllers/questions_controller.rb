class QuestionsController < ApplicationController
	
	def index
		@question = Question.new
		@questions = Question.all
	end

	def create
		Question.create(params[:question])
		redirect_to root_path
	end

	def show
		@question = Question.find(params[:id])
	end
	
end