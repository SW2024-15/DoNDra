class CreateUserAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :user_answers do |t|
      t.references :user, null: false, foreign_key: true # ユーザー情報
      t.references :question, null: false, foreign_key: true # 問題情報
      t.boolean :correct # 正誤情報
      t.string :answer # ユーザーの選択肢（○、×)
      t.datetime :answered_at # 回答した日時

      t.timestamps
    end
  end
end
