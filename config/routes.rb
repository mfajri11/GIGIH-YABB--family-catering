Rails.application.routes.draw do
  get 'cusomters/new'
  get 'cusomters/create'
  # get 'menus/index'
  # get 'menus/new'
  # get 'menus/show'
  # get 'menus/edit'
  # get 'menus/update'
  # get 'menus/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :menus
end
