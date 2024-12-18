class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  validates :user_answer, presence: true
  
  before_save :check_correct
  
  def self.incorrect_for_user(user)
    where(user: user, correct: false).includes(:question)
  end
  
  private
  
  def check_correct
    self.correct = (user_answer == question.correct_answer)
  end
end
