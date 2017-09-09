Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'

  get 'user', to: 'users#show'

  get 'posts/:id/likes', to: 'posts#like', as: 'like'

  scope 'users/:id', as: 'user' do
    resources :bios
  end

  resources :posts do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
