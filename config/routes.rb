Rails.application.routes.draw do
 match 'base_articles/new'=>'base_articles#new', via: [:get, :post]
 match 'base_articles/edit/:id'=>'base_articles#edit', via: [:get, :post]
 match 'base_articles/:id'=>'base_articles#update', via: [:get, :post]
 resources :authors
 resources :base_articles
 resources :authors


end
