Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :costumes do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end
    resources :bookings, only: [:index, :edit, :update] do
      member do
        get :confirm
      end
    end

end
