Rails.application.routes.draw do
  resources :stacks
  resources :entities
  resources :acronyms
  resources :holds
  resources :citations do
    collection do
      put :read
    end
  end

	resources :strands do
    collection do
      patch :sort
    end
  end

  resources :sources do
    collection do
      post :import
    end
  end

  get '/sources/:id/reimport', to: 'sources#reimport', as: 'reimport'
  get '/annotations/:id/toggle', to: 'annotations#toggle', as: 'toggle'
  get '/stacks/:id/showsource', to: 'stacks#showsource', as: 'showsource'

  resources :thoughts
  patch '/thoughts/:id/transfer', to: 'thoughts#transfer', as: 'transfer'
  patch '/application', to: 'application#hidesource', as: 'hidesource'

  resources :annotations
  get '/search/:term', to: 'search#index', as: 'search'
  get '/search', to: 'search#new', as: 'new_search'

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/reading', to: 'pages#reading', as: 'reading'
  get '/grakn', to: 'pages#grakn', as: 'grakn'
  get '/aylien', to: 'pages#aylien', as: 'aylien'

  root to: 'sources#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end