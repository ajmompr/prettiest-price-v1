Rails.application.routes.draw do
  resources :favorites
  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
    mount RailsAdmin::Engine, at: "admin", as: "rails_admin"
  end

  devise_for :users

  root to: "products#index"

  get "/404", to: "errors#not_found"
  get "/500", to: "errors#internal_server_error"


  resources :retailers, only: :index
  resources :products, only: [:index, :show]
  resources :waitlist_entries, only: :create
  
  resources :snapshots, only: [] do
    collection do
      get "snaps_by_day"
    end
  end


  if Rails.env.development?
    mount RailsDb::Engine => "/rails/db", :as => "rails_db_admin"
  end

  match "*umatched_route", to: "errors#not_found", via: :all
end
