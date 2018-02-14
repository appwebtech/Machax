Rails.application.routes.draw do

  devise_for :users, controllers: { josembi: 'josembi' }

	root "home#index"
end
