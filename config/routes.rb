Rails.application.routes.draw do

  #devise_for :users, controllers: {
  #  sessions: 'users/sessions'
  #}
devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'
  
  match 'users/:id' => 'users#show', via: :get 
  
  
  controller :projects do 
    get '/projects/add_vote' => 'projects#add_vote', as: :add_vote
    get '/summary', to: 'projects#summary'
  end
  
  
  resources :projects, except: [:destroy, :edit]
  resources :users, only: [:show]
  resources :votes, except: [:destroy, :edit, :update]
  
end
