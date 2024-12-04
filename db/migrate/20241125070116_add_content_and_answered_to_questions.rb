# db/migrate/xxxx_add_answered_to_questions.rb
class AddAnsweredToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :answered, :boolean, default: false
  end
end
