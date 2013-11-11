MoolahMeerkat::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get]
  match 'auth/failure', to: redirect('/'), via: [:get]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get]
  
  root 'welcome#index'
 
  resources :users, except: [:index] do
    resources :achievements, only: [:index] do
    end
    resources :goals do
      resources :transactions do
      end
    end
    resources :connections do
    end
  end

end