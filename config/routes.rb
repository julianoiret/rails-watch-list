Rails.application.routes.draw do
  # get 'movies/new'
  # get 'bookmarks/new'
  # get 'bookmarks/index'
  # get 'lists/index'
  # get 'lists/new'
  # get 'lists/create'
  # get 'lists/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  resources :lists, only: [ :show, :new, :create] do
    resources :movies, only: [:new, :create]
    resources :bookmarks, only: [:new, :index]
  end
  resources :bookmarks, only: [:destroy]
end
