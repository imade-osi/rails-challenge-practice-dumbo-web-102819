Rails.application.routes.draw do
  resources :employees
  resources :companies
  resources :offices
  resources :buildings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
