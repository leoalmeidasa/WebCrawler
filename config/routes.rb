Rails.application.routes.draw do
  resources :quotes, only: [:index]
  get 'quotes/:search_tag', to: 'search#index'
  post 'login', to: 'authentication#create'
end
