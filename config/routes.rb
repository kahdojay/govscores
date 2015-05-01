Rails.application.routes.draw do
  root "welcome#index"

  resources :suggestions
  resources :sigs
  resources :issues
  resources :positions
end
