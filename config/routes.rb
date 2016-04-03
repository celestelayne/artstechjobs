Rails.application.routes.draw do
  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :jobs
  # You can have the root of your site routed with "root"
    root "jobs#index"
end
