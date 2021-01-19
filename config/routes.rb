Rails.application.routes.draw do
  root 'static_articles#about'
  get 'articles', to: 'static_articles#index'
  get 'articles/:id', to: 'static_articles#show'
end
