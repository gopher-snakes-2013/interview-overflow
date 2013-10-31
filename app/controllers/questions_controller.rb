class QuestionsController < ApplicationController

  def index
    @question = Question.new
    @questions = Question.all
  end

  def create
    Question.create(params[:question])
    redirect_to root_path
  end

end
