News::Application.routes.draw do
  use_doorkeeper
  devise_for :users

  namespace :api, defaults: { format: :json }, path: '/' do
    namespace :v1 do
 		resources :authors
    resources :users, only: [:show, :create]
    resources :sessions, only: [:create, :destroy]
    end
  end
end
