Rails.application.routes.draw do

resources :users
resources :sessions
resources :songs
resources :adds

root 'users#main'
end
