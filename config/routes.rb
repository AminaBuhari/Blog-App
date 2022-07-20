Rails.application.routes.draw do
  get 'cill/new'
  get 'cill/create'
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
    end
   
  end
end
