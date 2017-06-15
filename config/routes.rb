# frozen_string_literal: true
Rails.application.routes.draw do
  resources :places, except: [:new, :edit]
  # resources :locations
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  post '/create-place' => 'places#create'
  patch '/update-place/:id' => 'places#update'
  delete '/destroy-place/:id' => 'places#destroy'
  resources :users, only: [:index, :show, :update]
end
