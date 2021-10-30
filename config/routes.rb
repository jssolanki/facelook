Rails.application.routes.draw do
  resources :sessions

  resources :users do
    resources :posts do
      resources :comments
    end
  end

  resources :likes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
