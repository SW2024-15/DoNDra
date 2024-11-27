class AddContentAndAnsweredToQuestions < ActiveRecord::Migration[6.1]
  def change
    # 重複するcontentカラムの追加を削除
    add_column :questions, :answered, :boolean
  end
end
