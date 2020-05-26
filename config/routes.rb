Rails.application.routes.draw do
  root 'novel_nodes#index'
  resources :theme_words

  resources :novel_nodes, only: [:new, :create, :show, :index]

  get 'novel_nodes/:id/sequel_new', to: 'novel_nodes#sequel_new', as: 'sequel_new_novel_node'
  post 'novel_nodes/:id/sequel_create', to: 'novel_nodes#sequel_create', as: 'sequel_create_novel_node'
  post 'novel_nodes/:id/favorite', to: 'novel_nodes#favorite', as: 'favorite_novel_node'
  get 'completed_novel_nodes', to: 'novel_nodes#completed', as: 'completed_novel_nodes'

  namespace :management do
    root to: 'home#index', as: :root

    get 'sign_in',  to: 'sessions#new',  as: :new_session
    post 'sign_in', to: 'sessions#create', as: :session
    delete 'sign_out', to: 'sessions#destroy', as: :destroy_session

    resource :account, only: [:edit, :update] do
      put :password, on: :member
      patch :password, on: :member
    end

    resources :admins, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  namespace :api do
    namespace :private do
      get :me, to: 'me#show'
    end
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users
  get 'users/:id/favorite_novels', to: 'users#favorite_novels', as: :favorite_novels
  get 'users/:id/edit_password', to: 'users#edit_password', as: :edit_user_password
end
