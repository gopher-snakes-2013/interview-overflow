class QuestionsController < ApplicationController

  def index
    @question = Question.new
  end

  def create
    Question.create(params[:post])
    redirect_to root_path
  end

end
