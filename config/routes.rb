Rails.application.routes.draw do
  get '/' => 'home#index'
  resources :users do
    resources :photos do
      resources :comments, only: [:create, :destroy]
    end
  end

post '/users/:id/follow', to: 'users#follow', as: 'follow_user'
delete 'users/:id/unfollow', to: 'users#unfollow', as:'unfollow_user' 
  resources :tags, only: [:create, :destroy]
  get '/log-in' => "sessions#new"
  post '/log-in' => "sessions#create"
  get '/log-out' => "sessions#destroy", as: :log_out

end
