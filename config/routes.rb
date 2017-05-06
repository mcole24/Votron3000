Rails.application.routes.draw do
  devise_for :users
  resources :votes
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'
  
  
  controller :projects do 
    get 'add_vote/:project_id', to: 'projects#add_vote', as: :add_vote
  end
  
end
