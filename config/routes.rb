Rails.application.routes.draw do

  root 'sessions#new'

  resources :usuarios do
    resources :livros
  end

  get 'login', to: 'sessions#new'

  post 'acesso', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy'

end
