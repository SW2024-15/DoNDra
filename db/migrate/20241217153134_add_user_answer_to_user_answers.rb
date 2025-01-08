class AddUserAnswerToUserAnswers < ActiveRecord::Migration[7.1]
  def change
    add_column :user_answers, :answer, :string
  end
end
