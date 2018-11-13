Rails.application.routes.draw do
  resources :strands
  resources :thoughts
  resources :annotations
  resources :sources
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
