Rails.application.routes.draw do

  devise_for :users
  root 'users#show'

  get 'user', to: 'users#show'

  get 'posts/:id', to: 'posts#like', as: 'like'

  scope 'users/:id', as: 'user' do
    resources :bios
  end

  resources :posts do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
