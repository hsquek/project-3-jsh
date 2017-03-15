Rails.application.routes.draw do

  get 'bookings/calendar', to: 'bookings#calendar', as: 'calendar'
  get 'bookings/mybookings', to: 'bookings#mybookings', as: 'mybookings'
  get 'qrcodes/sendqr', to: 'qrcodes#sendqr', as: 'sendqr'
  resources :facilities
  resources :facility_types
  resources :bookings
  resources :qrcodes
  devise_for :users, :controllers => {registrations: 'users/registrations'}

  resources :complaints do
    resources :comments
  end

  root 'welcome#index'
  get '*path', to: 'welcome#index'
end
