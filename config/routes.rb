Alarming::Application.routes.draw do

  resources :users do
  	get 'authorize_mixcloud'
  end
  resources :alarms, except: %i[index]
  resource :session, only: %i[create destroy]
  
  root to: "welcome#index"
end
