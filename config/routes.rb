Rails.application.routes.draw do
  resources :quotes, only: [:index]
  get 'quotes/:search_tag', to: 'search#index'
  post '/auth/login', to: 'authentication#login'
end
