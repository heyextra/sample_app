Rails.application.routes.draw do
  get 'users/new'
root "static_pages#home"
get 'help'    => 'static_pages#help'
get 'about'   => 'static_pages#about'
get 'contact' => 'static_pages#contact'
get 'signup' => 'users#new'
resources :users
# Defines the root path route ("/")
# SYNTAX : root "controller_name#action_name"
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
