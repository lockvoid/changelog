Rails.application.routes.draw do
  resources :projects, only: [:index, :show, :new, :create] do
    resources :releases, shallow: true do
      resources :notices, shallow: true
    end
  end

  get "signup" => "registrations#new", as: :signup
  post "signup" => "registrations#create", as: :registrations

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create", as: :sessions
  get "logout" => "sessions#destroy", as: :logout

  constraints Constraints::Authenticated.new do
    root to: "projects#index"
  end

  root to: "sessions#new"
end
