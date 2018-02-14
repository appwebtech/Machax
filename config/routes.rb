Rails.application.routes.draw do

  resources :shots
  devise_for :users, controllers: { josembi: 'josembi' }

	root "home#index"
end
