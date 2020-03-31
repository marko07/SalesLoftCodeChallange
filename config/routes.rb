Rails.application.routes.draw do
  resources :people, only: [:index]

  root 'people#index'
end
