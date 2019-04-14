Rails.application.routes.draw do
  resources :flights
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }


root to: 'flights#search'

get '/search', to: 'flights#search'
#post '/purchase_ticket', to: 'flights#purchase_ticket'
get '/select_seats', to: 'bookings#select_seats'
get '/checkin', to: 'bookings#checkin'
end
