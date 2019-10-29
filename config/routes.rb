Rails.application.routes.draw do
  resources :kijis
  post "/kijis/new" => "kijis#create"
  get 'sessions/new'
  get 'users/new'
  root "static_pages#home"
  get "/index" => "static_pages#index"
  get "/article" =>"static_pages#article"
  get "/signup" =>"users#new"
  post "/signup" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" =>"sessions#destroy"
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
