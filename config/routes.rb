Rails.application.routes.draw do
  get "signup" => "registrations#new", as: :signup
  post "signup" => "registrations#create", as: :registrations

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create", as: :sessions
  get "logout" => "sessions#destroy", as: :logout
end
