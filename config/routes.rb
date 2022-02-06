Rails.application.routes.draw do
  root 'static_pages#top'
  resources :cooking_informations, only: %i[index] do
    get 'search_time', on: :collection
    post 'search_time', on: :collection
    get 'calculate_cooking_time', on: :collection
    post 'calculate_cooking_time', on: :collection
  end
end
