Rails.application.routes.draw do

  root 'home#index'

  constraints format: :json do
    resources :books
  end
end
