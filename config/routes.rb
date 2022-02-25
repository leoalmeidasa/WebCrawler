Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :quotes, only: [:index]
      get 'quotes/:search_tag', to: 'search#index'
      post 'login', to: 'authentication#create'
    end
  end
end
