Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "first#index"
    resources :first, only: %i[show]
  resources :posts
    post "/posts/upd", to: "posts#upd"
end
