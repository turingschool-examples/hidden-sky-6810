Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/flights", to: "flights#index"

  delete "/flight_passengers/:passenger_id", to: "flight_passengers#destroy"

  get "/airlines/:airline_id", to: "airlines#show"
end
