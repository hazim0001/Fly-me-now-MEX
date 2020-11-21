Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
      root to: "airplanes#index"
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

  resources :airplanes do
    resources :bookings, only: :create
    resources :ratings, only: :create
  end
  resources :bookings, only: [:index, :destroy, :edit, :update]

end
# 'devise/sessions#new'
