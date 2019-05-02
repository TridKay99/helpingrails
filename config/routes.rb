Rails.application.routes.draw do
  devise_for :workers, path: 'workers', controllers: { sessions: 'workers/sessions', registrations: 'workers/registrations'}
  devise_for :customers, path: 'customers', controllers: { sessions: 'customers/sessions', registrations: 'customers/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :customers
  resources :workers

  get '/', to:'home#index', as: 'home'

  get '/jobs', to: 'jobs#index', as: 'jobs'

  post '/jobs', to: 'jobs#create'
  get '/jobs/new', to: 'jobs#new', as: 'new_job'

  get '/jobs/:id', to: 'jobs#show', as: 'show_job'

  put '/jobs/:id', to: 'jobs#update'
  patch '/jobs/:id', to: 'jobs#update'
  get '/jobs/:id/edit', to: 'jobs#edit', as: 'edit_job'

  delete '/jobs/:id', to: 'jobs#destroy'

  get '/workers', to: 'worker#index', as: 'index_workers'

  get '/workers/:id', to: 'workers#show', as: 'show_worker'

  put '/workers/:id', to: 'workers#update'
  patch 'workers/:id', to: 'workers#update'
  get 'jobs/:id/edit', to: 'workers#edit', as: 'update_worker'


  root 'home#index'
end