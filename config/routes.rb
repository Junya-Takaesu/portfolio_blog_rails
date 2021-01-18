Rails.application.routes.draw do
  root 'application#index'
  get 'articles', to: 'static_articles#index'
  get 'articles/:id', to: 'static_articles#show'
end
