Rails.application.routes.draw do
  #resources :appointments
  devise_for :patients
  get 'home/index'

  devise_for :doctors
  devise_scope :doctor do
    get "signup", to: "doctors/registrations#new"
    get "login", to: "doctors/sessions#new"
    post "login", to: "doctors/sessions#create"
    get "logout", to: "doctors/sessions#destroy"
    post "signup", to: "doctors/registrations#create"
  end

  resources :appointments do
    get "update_status/:status", to: "appointments#update_status"
    get "send_prescription", to: "appointments#send_prescription"
    post "save_prescription", to: "appointments#save_prescription", on: :collection
  end

  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  