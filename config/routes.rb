Rails.application.routes.draw do
  get 'articles', to: 'static_articles#index'
  get 'articles/:id', to: 'static_articles#show'
end
