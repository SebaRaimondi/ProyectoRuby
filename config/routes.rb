Rails.application.routes.draw do
  resources :courses do
    resources :evaluations
    resources :students
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
