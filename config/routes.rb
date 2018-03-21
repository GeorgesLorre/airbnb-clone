Rails.application.routes.draw do

get "dashboard_contractor", to: "pages#dashboard_contractor"
get "dashboard_client", to: "pages#dashboard_client"

  devise_for :users
  root to: 'services#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :services do
    resources :bookings do
      resources :reviews
    end
  end
end
