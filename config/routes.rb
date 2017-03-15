Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'bookings/calendar', to: 'bookings#calendar', as: 'calendar'
  get 'gencode' => 'welcome#gencode'
  resources :facilities
  resources :facility_types
  resources :bookings
  resources :qrcodes
  devise_for :users, :controllers => {registrations: 'users/registrations'}

  resources :complaints do
    resources :comments
  end

  root 'welcome#index'
end
