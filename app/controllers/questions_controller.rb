class QuestionsController < ApplicationController

  def index
    @question = Question.new
  end

  def create
    Question.create(params[:post])
    redirect_to 'index'
  end

end
