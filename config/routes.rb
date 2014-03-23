Rails.application.routes.draw do
  resources :authors

 resources :base_articles
 resources :authors
 match '/articles/new'=>'articles#new', via: [:get, :post]
end
