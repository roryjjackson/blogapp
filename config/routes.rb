Rails.application.routes.draw do
  resources :posts
  resources :flats
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :articles, only: %i[new create index show]
  resources :categories do
    resources :articles do
      resources :comments
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
