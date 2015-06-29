News::Application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json }, path: '/' do
    namespace :v1 do
 		resources :authors
    resources :users, only: [:show]
    end
  end
end
