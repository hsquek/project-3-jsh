Rails.application.routes.draw do

  resources :complaints do
    resources :comments
  end
  devise_for :users, :controllers => {registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  root 'welcome#index'
end
