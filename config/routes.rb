Rails.application.routes.draw do
 
  post '/login', to: 'auth#login', default: {:format => :json}
  root to: 'users#index'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
    end
   
  end
  
  scope 'api' do
    get '/posts/:id/comments' => 'api/comments#index', as: :api_post_comments
    post '/posts/:id/comments' => 'api/comments#create', as: :api_post_comments_create
    resources :users, only: [] do
      get '/posts' => 'api/posts#index', as: :api_user_posts
    end
  end



end
