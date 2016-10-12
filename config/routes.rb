Rails.application.routes.draw do
  root to: 'users#index'

  get '/auth/github', as: :github_login
  get '/signout', to: 'sessions#destroy', as: :github_logout
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :dashboard, only: [:show], as: 'show_page'
end
