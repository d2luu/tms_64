Rails.application.routes.draw do
  root "static_pages#home"
  get "home" => "static_pages#home"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users, only: [:update, :edit, :show]
  
  namespace :admin do
    resources :users, except: [:update, :edit]
    resources :subjects
    resources :courses do
      resources :course_subjects, only: [:show]
    end
  end
end
