Rails.application.routes.draw do

  root 'sessions#new'

  resources :usuarios do
    resources :livros do
      resources :comentarios
    end
  end

  post 'comentarios/exibe_comentario', action: :exibe_comentario, controller: 'comentarios', as: 'exibe_comentario'

  get 'login', to: 'sessions#new'

  post 'acesso', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy'

end
