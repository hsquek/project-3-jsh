Rails.application.routes.draw do
  resources :facilities
  resources :facility_types
  resources :bookings
  resources :qrcodes
  get 'gencode' => 'welcome#gencode'
  devise_for :users, :controllers => {registrations: 'users/registrations'}

  resources :complaints do
    resources :comments
  end

  root 'welcome#index'
end
