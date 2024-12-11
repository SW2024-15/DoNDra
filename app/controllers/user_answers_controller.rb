class UserAnswersController < ApplicationController
    
    def incorrect
    # ログイン中のユーザーの間違えた問題を取得
        @incorrect_answers = UserAnswer.incorrect_for_user(current_user)
    end
end
