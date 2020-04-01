Rails.application.routes.draw do
  resources :people, only: [:index] do
    get :duplicated_users
  end

  root 'people#index'
end
