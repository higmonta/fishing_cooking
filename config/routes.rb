Rails.application.routes.draw do
  root 'static_pages#top'
  resources :cookings, only: %i[index]
end
