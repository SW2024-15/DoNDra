Rails.application.routes.draw do
<<<<<<< HEAD
=======
  get 'questions/index'
  get 'questions/show'
  resources :questions, only: [:index, :show]
>>>>>>> abe9febff0a6f3c99967216557492e0c5c93d243
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")a
  # root "posts#index"
end
