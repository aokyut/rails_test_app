Rails.application.routes.draw do
  get 'users/new'
  root "static_pages#home"
  get "/index" => "static_pages#index"
  get "/article" =>"static_pages#article"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
