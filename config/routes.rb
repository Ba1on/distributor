Distributor::Application.routes.draw do
  get 'user' => 'users#index'

  controller :session do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'session/new'
  get 'session/create'
  get 'session/destroy'

  resources :issues

  resources :sprints do
    patch 'close', on: :member
  end

  root 'issues#index'

  namespace :api do
    resources :event, only: [] do
      collection do
        post '/recieve', to: "event#recieve"
      end
    end
  end
end
