Rails.application.routes.draw do
  resources :list
  root 'products#index'
end
