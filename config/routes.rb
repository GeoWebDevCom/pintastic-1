Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Tell it which controller and action will handle the home page: controller home, action show -->
  root to: 'home#show'

  resources :boards

  namespace :admin do
    resources :boards
    resources :pins
  end

end
