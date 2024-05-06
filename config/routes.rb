Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users do
    resources :events, only: [:new, :create]
  end
  resources :users, only: [:show]
  resources :attendances, only: [:create, :destroy]

  # config/routes.rb
resources :events do
  member do
    delete 'remove_attendee', to: 'events#remove_attendee'
  end
end

  
  # Defines the root path route ("/")
  root "events#index"
end
