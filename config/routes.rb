Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  #  It's really just for blog admins, and we want to set up a URL scheme to segregate admin things into their own logical space.
  get '/admin/stats', to: 'stats#index'

  root 'posts#index'
end
