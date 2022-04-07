Rails.application.routes.draw do
  root 'static_pages#top'
  resources :cooking_informations, only: %i[index] do
    collection do
      get 'search_time'
      post 'search_time'
      get 'search_calculate_cooking_time'
      post 'search_calculate_cooking_time'
      get 'calculate_cooking_time'
      post 'calculate_cooking_time'
    end
  end
  resources :users, only: %i[new create]
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
end
