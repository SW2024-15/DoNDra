Rails.application.routes.draw do
  
  get 'questions/index'
  get 'questions/show'
  resources :questions, only: [:index, :show]

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  get 'top/main'
  post 'top/login'
  root 'top#main'
  get 'top/logout'
  # Defines the root path route ("/")a
  # root "posts#index"
end
