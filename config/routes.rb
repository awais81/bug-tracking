Rails.application.routes.draw do
  
  devise_for :users
  root :to => 'projects#index'
	resources :projects do
		resources :bugs
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
