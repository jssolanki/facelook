Rails.application.routes.draw do
  resources :users do
    resources :posts do
      resources :comments
    end
  end

  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
