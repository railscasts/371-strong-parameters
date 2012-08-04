Forum::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :topics
  resources :users

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :topics
    end
  end

  root to: 'topics#index'
end
