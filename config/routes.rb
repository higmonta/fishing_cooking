Rails.application.routes.draw do
  root 'static_pages#top'
  get 'terms', to: 'static_pages#terms'
  resource :profile, controller: 'users', only: %i[show edit update]
  resources :cooking_informations, only: %i[index] do
    collection do
      get 'search_time'
      post 'search_calculate_cooking_time'
      post 'calculate_cooking_time'
    end
  end
  resources :users, only: %i[new create]
  resources :cooking_memories, only: %i[new create index edit update destroy] do
    delete 'destroy_image', on: :member
  end
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  resources :password_resets, only: %i[new create edit update]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
