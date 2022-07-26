Rails.application.routes.draw do
root "static_pages#home"
# Defines the root path route ("/")
# SYNTAX : root "controller_name#action_name"

  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/help'
  get 'static_pages/contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
