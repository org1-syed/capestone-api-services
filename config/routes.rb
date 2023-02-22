Rails.application.routes.draw do

  root 'home#index'

  constraints format: :json do
    namespace :api do
      namespace :v1 do
        resources :books
      end
    end
  end
end
