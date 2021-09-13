Rails.application.routes.draw do
  	devise_for :users
  	get 'schedules/login_check'
  	get 'schedules/find'
	post 'schedules/find'
	get 'schedules/about'
	
  	resources :schedules
	root to: 'schedules#login_check'
  	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
