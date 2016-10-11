Rails.application.routes.draw do
  root to: 'users#new'

  get '/auth/github', as: :github_login
  get '/signout', to: 'sessions#destroy', as: 'signout'
  get '/auth/:provider/callback', to: 'sessions#create'
end
