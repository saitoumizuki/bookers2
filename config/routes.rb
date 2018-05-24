Rails.application.routes.draw do
	devise_for :users

	get 'books/about'

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :books
	root 'books#index'

	resources :users, only: [:show, :new, :edit, :update]
end
