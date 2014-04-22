Alarming::Application.routes.draw do

  resources :users 
  #resources :alarms, :only => [:index, :new, :show, :edit, :create, :update, :destroy, :wake_up]
  #end
  resource :session, only: %i[create destroy]
  
  
  get "auth/mixcloud/callback", to: "users#authorize_mixcloud"

  root to: "welcome#index"
end
