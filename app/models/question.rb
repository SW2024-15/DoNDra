# app/models/questions.rb
# app/models/question.rb
class Question < ApplicationRecord
  has_many :user_answers
  has_many :answering_users, through: :user_answers, source: :user

module Questions
  extend ActiveSupport::Concern

  included do
    # スコープやバリデーション
    scope :recent, -> { order(created_at: :desc) }
    scope :unanswered, -> { where(answered: false) }

    validates :content, presence: true, length: { minimum: 10 }
    validates :correct_answer, presence: true
  end

  # クラスメソッド
  class_methods do
    def unanswered_count
      unanswered.count
    end
  end

  # インスタンスメソッド
  def mark_as_answered!
    update!(answered: true)
  end

  def short_content
    content.truncate(50)
  end

  def correct?(answer)
    answer.to_s.strip.casecmp(correct_answer.to_s.strip).zero?
  end
end
  # ここにモデルの内容
end
