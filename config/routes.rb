Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  post 'homes/guest_sign_in', to: 'homes#new_guest'
  get 'search' => 'movies#search'


  resource :profile, only:[:new,:create]
  resource :timeline, only:[:show]

  resources :favorites, only:[:index]

  resources :movies, only:[:index, :show, :new, :create, :destroy, :edit, :update] do
    resources :comments, only: [:index, :new, :create]
    resources :spoilers, only: [:index, :new, :create]
    resource :like, only: [:show, :create, :destroy]
  end

  get 'terms', to: 'static_pages#terms'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
end
