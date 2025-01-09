class UserAnswersController < ApplicationController
    before_action :authenticate_user!
    
    def incorrect
    # ログイン中のユーザーの間違えた問題を取得
        @incorrect_answers = UserAnswer.incorrect_for_user(current_user)
    end
    
    #リセット機能のアクションを追加
    def reset_answers
    # 現在のユーザーの回答データを削除
        current_user.user_answers.destroy_all

    # リセット後、ホームページにリダイレクト
    redirect_to root_path, notice: "解答データをリセットしました。"
    end
end
