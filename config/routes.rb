Rails.application.routes.draw do
  root 'articles#about'
  get 'articles', to: 'articles#index'
  get 'articles/:id', to: 'articles#show'
end
