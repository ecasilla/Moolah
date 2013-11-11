MoolahMeerkat::Application.routes.draw do
  
  root 'welcome#index'
  
  resources :users, except: [:index] do
    
    collection do
      get 'search'
    end

    resources :achievements, only: [:index] do
    end

    resources :goals do
      resources :transactions do
      end
    end

    resources :connections, only: [:create, :index, :destroy] do
    end

  end
  
end
