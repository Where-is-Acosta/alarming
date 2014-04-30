Alarming::Application.routes.draw do

  resources :users do
  	get 'authorize_mixcloud'
  end
  #resources :alarms, :only => [:index, :new, :show, :edit, :create, :update, :destroy, :wake_up]
  #end
  resource :session, only: %i[create destroy]
  

  get '/auth/mixcloud/callback', to: 'users#mixcloud_callback'

  root to: "welcome#index"
end
