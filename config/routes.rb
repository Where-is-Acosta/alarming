Alarming::Application.routes.draw do
  # Routes for users	
  resources :users do
  	get 'authorize_mixcloud'
  end
  # Routes for alarms
  resources :alarms, except: %i[index]
  # Routes for session handling
  resource :session, only: %i[create destroy]
  # Routes to the landing page
  root to: "welcome#index"
end
