Rails.application.routes.draw do
  root 'boards#index'
  resources :boards do
    resources :tasks do
      get :check
      get :uncheck
    end
  end
  resources :tasks
  resources :stages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
