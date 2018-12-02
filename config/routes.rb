Rails.application.routes.draw do
  resources :projects, only: [:index, :show, :new, :create] do
    resources :releases, only: [:new, :edit, :new, :create, :update, :destroy], shallow: true
  end

  get "signup" => "registrations#new", as: :signup
  post "signup" => "registrations#create", as: :registrations

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create", as: :sessions
  get "logout" => "sessions#destroy", as: :logout

  root "projects#index"
end
