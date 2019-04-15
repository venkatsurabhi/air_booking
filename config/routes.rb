Rails.application.routes.draw do
  resources :flights
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }



root to: 'flights#search'

get '/search', to: 'flights#search'
get '/select_seats', to: 'bookings#select_seats'
get '/checkin', to: 'bookings#checkin'
get '/checkin_seats', to: 'bookings#checkin_seats'
end
