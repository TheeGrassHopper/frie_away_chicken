Rails.application.routes.draw do  
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  resources :recipes

  root "recipes#index"

end
