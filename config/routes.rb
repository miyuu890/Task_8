Rails.application.routes.draw do
  get 'tasks/new', to: 'tasks#new'
  post 'tasks/create', to:'tasks#create'
  get 'tasks/index', to: 'tasks#index'
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
  resources :tasks
  end
end
