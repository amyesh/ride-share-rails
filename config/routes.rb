Rails.application.routes.draw do
  
  root to: "homepages#index"
  
  resources :drivers
  resources :passengers
  resources :trips, only: [:index, :show]
  resources :homepages

  # Nested routes for Driver trips
  resources :drivers do
    resources :trips
  end

  # Nested routes for Passenger trips
  resources :passengers do
    resources :trips
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
