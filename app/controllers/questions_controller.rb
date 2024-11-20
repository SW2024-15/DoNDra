class QuestionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @question = Qusetion.all
  end

  def show
    @question = Question.find(params[:id])
  end
end
