Rails.application.routes.draw do
		root "jobs#index"

	  resources :jobs, :users

	  get '/signup' => 'users#new'
	  get '/login' => 'sessions#new'
	  post '/sessions' => 'sessions#create'
	  delete '/logout' => 'sessions#destroy'

  # Example resource route (maps HTTP verbs to controller actions automatically):
    
    get 'tags/:tag', to: 'jobs#index', as: "tag"
  # You can have the root of your site routed with "root"
    
end
