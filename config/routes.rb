Rails.application.routes.draw do
  resources :campaigns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'campaigns#index'
end
