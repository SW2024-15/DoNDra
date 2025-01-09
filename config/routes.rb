Rails.application.routes.draw do
  devise_for :users
  resources :users

  # TOP画面用
  get 'top/main'
  post 'top/login'
  root 'top#main'
  get 'top/logout'

  # 問題に関するルート
  resources :questions, only: [:index, :show] do
    post :answer, on: :member
    get :next, on: :collection
    get :result, on: :collection
  end
  
  get 'questions/next', to: 'questions#next', as: 'next_question'

  # 間違えた問題リスト
  get 'user_answers/incorrect', to: 'user_answers#incorrect', as: 'incorrect_user_answers'
  
  #リセット
  delete '/reset_answers', to: 'user_answers#reset_answers', as: 'reset_answers'
  
  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
  
end
