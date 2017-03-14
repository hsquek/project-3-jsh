Rails.application.routes.draw do


  # get 'qrcodes/:id',  to: 'qrcodes#compare' , as: 'qrcompare'

  resources :facilities
  resources :facility_types
  resources :bookings
  resources :qrcodes
  get 'gencode' => 'welcome#gencode'
  devise_for :users, :controllers => {registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#   resources :qrcodes do
#   collection do
#     get :compare
#   end
# end

  root 'welcome#index'
end
