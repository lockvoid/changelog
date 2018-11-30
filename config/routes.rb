Rails.application.routes.draw do
  resources :projects, only: [:index, :show, :new, :create]

  get "signup" => "registrations#new", as: :signup
  post "signup" => "registrations#create", as: :registrations

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create", as: :sessions
  get "logout" => "sessions#destroy", as: :logout

  root "projects#index"
end
