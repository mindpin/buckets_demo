Rails.application.routes.draw do
  resources :buckets

  resources :posts do
    resources :buckets
  end

  root 'buckets#index'
end
