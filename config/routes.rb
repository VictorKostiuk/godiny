Rails.application.routes.draw do
  devise_for :users
  resources :subjects
  resources :home do
    member do
      get 'selected_subject'
    end
  end
  root to: 'home#index'
  resources :tasks do
    member do
      get 'mark_as_completed'
    end
  end
end
