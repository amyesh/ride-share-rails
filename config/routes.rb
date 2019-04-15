Rails.application.routes.draw do
  # get 'trips/index'
  # get 'drivers/index'
  # get 'passengers/index'

  get "/", to: 'homepage#index', as: 'root'
  resources :drivers, :passengers, :trips

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
