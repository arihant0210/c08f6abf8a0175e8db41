Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root 'home#index'
	get '/add_favourite', to: 'home#add_favourite', as: 'add_favourite'
	get '/remove_favourite', to: 'home#remove_favourite', as: 'remove_favourite'


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
