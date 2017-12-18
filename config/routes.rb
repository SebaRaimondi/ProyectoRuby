Rails.application.routes.draw do
  resources :courses do
    resources :exams
  end

  resources :courses do
    resources :students
    post 'results', to: 'courses#results'
  end

  devise_for :users

  authenticated :user do
    root 'home#logged', as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
