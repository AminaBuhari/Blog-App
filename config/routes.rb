Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
    post "/posts/:id/like" => "posts#like", as: :like
    post "/posts/:id/comment" => "posts#comment", as: :comments
  end
end
