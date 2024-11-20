class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  before_save :check_correct
  
  private
  
  def check_correct
    self.correct = (user_answer == question.correct_answer)
  end
end
