Rails.application.routes.draw do
  root 'static_pages#top'
  resources :cooking_informations, only: %i[index]
end
