Alarming::Application.routes.draw do

  resources :users do
  	get 'authorize_mixcloud'
  	get 'mixcloud_callback'
  	get 'save_mixcloud_auth_token'
  end
  #resources :alarms, :only => [:index, :new, :show, :edit, :create, :update, :destroy, :wake_up]
  #end
  resource :session, only: %i[create destroy]
  
  
  get "auth/mixcloud/callback", to: "users#mixcloud_callback"
  get "auth/mixcloud/save", to: "users#save_mixcloud_auth_token"

  root to: "welcome#index"
end
