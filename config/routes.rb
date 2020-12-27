Rails.application.routes.draw do
  root to: 'items#index'
<<<<<<< Updated upstream
  #  get '/items', to: 'users#index'
=======
  resources :items, only: [:new,:create,]
>>>>>>> Stashed changes
end
