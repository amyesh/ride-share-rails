Rails.application.routes.draw do
  get 'homepages/index'
  resources :drivers, :passengers, :trips, :homepages

  root to: "homepages#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
