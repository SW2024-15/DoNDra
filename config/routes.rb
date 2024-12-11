Rails.application.routes.draw do
  resources :users

  # TOP画面用
  get 'top/main'
  post 'top/login'
  root 'top#main'
  get 'top/logout'

  # 問題に関するルート
  resources :questions, only: [:index, :show] do
    post :answer, on: :member
  end
  get 'questions/next', to: 'questions#next', as: 'next_question'

  # 間違えた問題リスト
  get 'user_answers/incorrect', to: 'user_answers#incorrect', as: 'incorrect_user_answers'

  # aboutページ（オプション）
  get 'about', to: 'top#about'
  
  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
  
end
