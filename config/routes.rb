Rails.application.routes.draw do
  resources :people, only: [:index] do
    get :duplicated_users
  end

  get :notes, controller: "notes", action: :index
  get :marco, controller: "about", action: :index

  root 'people#index'
end
