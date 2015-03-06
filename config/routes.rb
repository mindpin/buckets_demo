Rails.application.routes.draw do
  resources :buckets

  resources :posts
  root 'buckets#index'
end
