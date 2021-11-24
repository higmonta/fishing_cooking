Rails.application.routes.draw do
  root 'static_pages#top'
  resources :cooking_informations, only: %i[index] do
    get 'search_time', on: :collection
  end
end
