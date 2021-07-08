Rails.application.routes.draw do

  get 'searches/search' => 'searches#search'

  devise_for :users

  root to:'homes#top'
  get 'home/about' => 'homes#about', as: 'about'


  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end


  resources :users, only: [:index, :show, :edit, :update] do
   resource :relationships, only: [:create, :destroy]
   get 'follower' => 'relationships#follower'
   get 'followers' => 'relationships#followed'
  end
end
