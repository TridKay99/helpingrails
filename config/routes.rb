Rails.application.routes.draw do
  devise_for :workers, path: 'workers', controllers: { sessions: 'workers/sessions'}
  devise_for :customers, path: 'customers', controllers: { sessions: 'customers/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :customers
  resources :workers

  root 'home#index'
end
