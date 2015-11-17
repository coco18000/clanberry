# coding:utf-8

Rails.application.routes.draw do
  root 'videos#index'

  resources :users do
    # 検索用
    collection do
      get 'search'
    end
  end
  
  resources :messages, except: [:destroy, :update, :edit, :show]
  
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'


  match '/help', to: 'users#help', via: 'get'

  resources :videos do
    resources :comments
    collection do
      get 'search'
    end
  end
  match '/search/:tag', to: 'videos#index', via: 'get', as: :search_tag

  namespace :admin do
    resources :users, :comments, :videos
  end

  resources :favorites, only: [:create, :destroy]

end
