class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.text :content               # 問題文
      t.string :option_a            # 選択肢A
      t.string :option_b            # 選択肢B
      t.string :correct_answer      # 正しい選択肢（'A' or 'B'）
      t.boolean :answered, default: false  # 解答状態（未解答ならfalse）
      
      t.timestamps
    end
  end
end
