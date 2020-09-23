Rails.application.routes.draw do

  #allows me to use chained URLs
  resources :users, only: [:new, :create, :edit, :update] do
    resources :tasks
  end
  
  resources :categories
  
  get 'categories/:category_id/tasks', to: 'tasks#index', as: 'categories_tasks'

  #fixed rails auto direct issue you have to manual redirect
  get 'users/:user_id', to: 'users#edit'

  #custom login/logout routes
  get '/signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'

  root to: 'sessions#new'

  #used for omni auth
  get '/auth/:provider/callback', to: 'sessions#create'

end