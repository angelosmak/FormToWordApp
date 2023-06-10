Rails.application.routes.draw do
  resources :form_submissions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "form_submissions#new"
  # Defines the root path route ("/")
  # root "articles#index"
end
