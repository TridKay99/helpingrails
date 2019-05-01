Rails.application.routes.draw do
  devise_for :workers, path: 'workers', controllers: { sessions: 'workers/sessions'}
  devise_for :customers, path: 'customers', controllers: { sessions: 'customers/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :customers
  resources :workers

  get '/jobs', to: 'jobs#index', as: 'jobs'
  post '/jobs', to: 'jobs#create'
  get '/jobs/new', to: 'jobs#new', as: 'new_job'
  get '/jobs/:id', to: 'jobs#show', as: 'show_job'
  put '/jobs/:id', to: 'jobs#edit', as: 'edit_job'
  patch '/jobs/:id', to: 'jobs#update'
  get '/jobs/:id/edit', to: 'jobs#edit', as: 'update_edit_job'


  root 'home#index'
end
