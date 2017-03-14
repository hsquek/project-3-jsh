Rails.application.routes.draw do


  get 'bookings/calendar', to: 'bookings#calendar', as: 'calendar'
  resources :facilities
  resources :facility_types
  resources :bookings

  devise_for :users, :controllers => {registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
