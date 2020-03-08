Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'dashboard#index'

  resources :users, only: [] do
    resources :tweets, only: [:create]
    resources :follows, only: [:create] do
      delete :destroy, on: :collection
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: :show do
        resources :tweets, only: :index
        resources :follows
      end
    end
  end
end
