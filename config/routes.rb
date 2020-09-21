Rails.application.routes.draw do

  #not sure what I plan on doing with this route yet
  get 'categories/index'
  

  #allows me to use chained URLs
  resources :users, only: [:new, :create, :edit, :update] do
    resources :tasks
    get 'categories/search_result', to: 'categories#search_result'
  end
  resources :tasks, only: [:index]
  
  resources :categories do
    resources :tasks
  end

  #fixed rails auto direct issue you have to manual redirect
  get 'users/:user_id', to: 'users#edit'

  #custom login/logout routes
  get '/signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'

  root to: 'site#index'

  #used for omni auth
  get '/auth/:provider/callback', to: 'sessions#create'

end