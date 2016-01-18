Rottenpotatoes::Application.routes.draw do
	resources :movies
	get 'similar/:id' => 'movies#similar', as: :similar
	# map '/' to be a redirect to '/movies'
	root :to => 'movies#index'
end
