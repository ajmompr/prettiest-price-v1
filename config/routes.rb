Rails.application.routes.draw do
  # TODO: restrict to only admins
  authenticate(:user, lambda { |user| user.admin? }) do
    mount(RailsAdmin::Engine, { :at => "admin", :as => "rails_admin" })
  end
  
  devise_for :users
  get "/404", to: "errors#not_found"
  get "/500", to: "errors#internal_server_error"

  resources :listings
  resources :retailers
  resources :snapshots
  resources :products
  resources :waitlist_entries, only: [:create]

  if Rails.env.development?
    mount RailsDb::Engine => "/rails/db", :as => "rails_db_admin"
  end

  # Defines the root path route ("/") 
  root to: "static#index"

  match "*umatched_route", to: "errors#not_found", via: :all
end
