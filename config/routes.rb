Rails.application.routes.draw do
  resources :buckets

  resources :posts do
    resources :buckets
    resources :bucketings
  end

  root 'buckets#index'
end
