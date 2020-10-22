Rails.application.routes.draw do
  resources :ingredients
  resources :meals
  root 'homepage#index'
  get '/tester', to: 'homepage#tester'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
