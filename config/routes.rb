Rails.application.routes.draw do
  resources :quotes, only: [:index]
  get 'quotes/:search_tag', to: 'search#index'
  post 'signin', to: 'authentication#signin'
end
