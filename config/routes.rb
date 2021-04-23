Rails.application.routes.draw do
  root 'about#index'
  get 'articles', to: 'articles#index'
  get 'articles/:id', to: 'articles#show'
  get 'portfolio', to: 'portfolio#index'
end
