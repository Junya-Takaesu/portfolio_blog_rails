Rails.application.routes.draw do
  root 'static_articles#about'
  get 'articles', to: 'static_articles#index'
  get 'articles/:id', to: 'static_articles#show'
  get 'bugs', to: 'static_articles#bugs' # just for me
end
