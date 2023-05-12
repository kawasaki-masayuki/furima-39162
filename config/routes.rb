Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show,] #:edit, :update]←編集機能時に実装する
end
