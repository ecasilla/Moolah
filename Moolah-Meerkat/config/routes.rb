MoolahMeerkat::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get]
  match 'auth/failure', to: redirect('/'), via: [:get]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get]
  
  root 'welcome#index'
<<<<<<< HEAD
=======
<<<<<<< HEAD
  
=======
 
>>>>>>> master
>>>>>>> 563d3f5f648ad73a06a465fe473ab7aa1197d254
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

end
