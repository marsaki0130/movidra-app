Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resource :profile, only:[:new,:create]

  resources :movies, only:[:index, :show, :new, :create, :destroy] do
    resources :comments, only: [:index, :new, :create]
    resources :spoilers, only: [:index, :new, :create]
  end
end
