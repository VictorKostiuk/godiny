Rails.application.routes.draw do
  devise_for :users
  resources :subjects
  root to: 'home#index'
  resources :tasks do
    member do
      get 'mark_as_completed'
    end
  end
end
