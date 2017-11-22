Rails.application.routes.draw do
  resources :products do
    collection do
      get :most_reviewed
      get :most_recent
      get :made_in_us
    end
    resources :reviews
  end
  root 'products#index'
end
