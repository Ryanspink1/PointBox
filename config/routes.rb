Rails.application.routes.draw do
  root 'users#new'

  resources :users, only: [:new, :create, :show, :edit, :update]

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update] do
      resources :points, only: [:create, :destroy];
      resources :rewards, only: [:create, :destroy]
    end
  end


    resource :users, only: [:show] do
      resources :rewards, only:[:edit, :update]
    end

  # namespace :admin do
  #   resources :points, only: [:edit, :create]
  # end



  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
