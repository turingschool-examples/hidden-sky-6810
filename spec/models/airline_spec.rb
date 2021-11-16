require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passengers).through(:flights) }

  it { should validate_presence_of :name }

  describe 'instance methods' do
    describe 'unique_adults' do
      before do
        @airline1 = Airline.create!(name: "Backtier")
        @flight1 = @airline1.flights.create!(number: 1001, date: "11/16/21", departure_city: "Denver", arrival_city: "Los Angeles")
        @flight2 = @airline1.flights.create!(number: 1002, date: "11/16/21", departure_city: "Miami", arrival_city: "Phoenix")
        @flight3 = @airline1.flights.create!(number: 1003, date: "11/16/21", departure_city: "Chicago", arrival_city: "New York City")
        @passenger1 = Passenger.create!(name: "Abbie Aaron", age: 33)
        @passenger2 = Passenger.create!(name: "Bob Benjamin", age: 28)
        @passenger3 = Passenger.create!(name: "Chris Carrey", age: 30)
        @passenger4 = Passenger.create!(name: "Dexter Daring", age: 13)
        @flight_passenger1 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id)
        @flight_passenger2 = FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger2.id)
        @flight_passenger3 = FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger3.id)
        @flight_passenger4 = FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger4.id)
        @flight_passenger5 = FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger1.id)
      end

      it "returns unique passengers 18 or older for airline" do
        expect(@airline1.unique_adults).to include(@passenger1)
        expect(@airline1.unique_adults).to include(@passenger2)
        expect(@airline1.unique_adults).to include(@passenger3)
      end
    end
  end
end
