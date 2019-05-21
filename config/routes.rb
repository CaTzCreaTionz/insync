Rails.application.routes.draw do
  devise_for :users

  root controller: :rooms, action: :index

  resources :rooms do
    resources :messages
  end

  resources :users

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
