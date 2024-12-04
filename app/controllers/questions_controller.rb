class QuestionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find(params[:id])
  end
end
