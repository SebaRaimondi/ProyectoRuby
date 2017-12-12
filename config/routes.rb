Rails.application.routes.draw do
  resources :results
  resources :evaluations
  resources :courses
  resources :students
  resources :courses do
      end

  devise_for :users
  get 'home/index'
  get 'home/logged'

  authenticated :user do
    root 'home#logged', as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
