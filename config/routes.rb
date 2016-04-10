Rails.application.routes.draw do
		resources :jobs, :users 

		root "jobs#index"
	  
	  get '/signup' => 'users#new'
	  get '/login' => 'sessions#new'
	  post '/sessions' => 'sessions#create'
	  get '/logout' => 'sessions#destroy'

	  # get 'users/index'
	  # get 'users/new'

  # Example resource route (maps HTTP verbs to controller actions automatically):
    
    get 'tags/:tag', to: 'jobs#index', as: "tag"
  # You can have the root of your site routed with "root"
    
end
