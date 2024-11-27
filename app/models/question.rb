module Questions
  extend ActiveSupport::Concern

  included do
    # スコープ: よく使うクエリを定義
    scope :recent, -> { order(created_at: :desc) }
    scope :unanswered, -> { where(answered: false) }

    # バリデーション: データが正しいかチェック
    validates :content, presence: true, length: { minimum: 10 }
    validates :correct_answer, presence: true
  end

  class_methods do
    # クラスメソッド: モデル全体に対するロジックを定義
    def unanswered_count
      unanswered.count
    end
  end

  # インスタンスメソッド: 個々のオブジェクトに対するロジックを定義
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

