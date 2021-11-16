require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it { should have_many :flights }
    it { should have_many(:passengers).through(:flights) }
  end

  describe 'methods' do
    it 'finds adults' do
      airline = Airline.create!(name: 'Test Airlines')

      flight1 = airline.flights.create(number: 1234, date: '08/03/22', departure_city: 'Phoenix', arrival_city: 'Tucson')
      flight2 = airline.flights.create(number: 4321, date: '08/04/22', departure_city: 'Denver', arrival_city: 'LA')

      passenger1 = Passenger.create!(name: 'Chloe', age: 30)
      passenger2 = Passenger.create!(name: 'Liam', age: 17)
      passenger3 = Passenger.create!(name: 'Mary', age: 30)
      passenger4 = Passenger.create!(name: 'Bri', age: 25)
      passenger5 = Passenger.create!(name: 'Naomi', age: 18)

      FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger1.id)
      FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger2.id)
      FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger5.id)
      FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger3.id)
      FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger4.id)

      expect(airline.adult_passengers).to eq([passenger4.name, passenger1.name, passenger3.name, passenger5.name])
    end
  end
end
