Rails.application.routes.draw do
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

  resources :thoughts
  patch '/thoughts/:id/transfer', to: 'thoughts#transfer', as: 'transfer'

  resources :annotations
  get '/search/:term', to: 'search#index', as: 'search'
  get '/search', to: 'search#new', as: 'new_search'

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/reading', to: 'pages#reading', as: 'reading'

  root to: 'sources#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end