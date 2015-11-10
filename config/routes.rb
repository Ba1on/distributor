Distributor::Application.routes.draw do
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
    patch 'start', on: :member
  end

  root 'issues#index'

  namespace :api do
    resources :dataredmine, only: [] do
      collection do
        post '/recieve', to: "dataredmine#recieve"
      end
    end
  end
end
