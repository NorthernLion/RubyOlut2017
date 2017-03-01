Rails.application.routes.draw do
  resources :styles
  resources :memberships do
    post 'confirm_member', on: :member
  end
  resources :beer_clubs
  resources :users do
    post 'toggle_jaahylla', on: :member
  end
  root 'breweries#index'
  resources :beers
  resources :breweries do
    post 'toggle_activity', on: :member
  end
  get 'kaikki_bisset', to: 'beers#index'
  resources :ratings, only: [:index, :new, :create, :destroy]
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'

  resource :session, only: [:new, :create, :destroy]
  resources :places, only:[:index, :show]
  post 'places', to:'places#search'
  get 'beerlist', to:'beers#list'
  get 'brewerylist', to:'breweries#list'

end
