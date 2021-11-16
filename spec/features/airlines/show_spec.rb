require 'rails_helper'

RSpec.describe "Airline Show Page" do
  before do
    @airline1 = Airline.create!(name: "Backtier")
    @airline2 = Airline.create!(name: "Delto")
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
    @flight_passenger6 = FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger1.id)
    @flight_passenger7 = FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger3.id)
    visit airline_path(@airline1)
    end

  describe "when I visit an Airline Show Page" do
    it "i see a list of adult passengers(unique) that have flights on that airline" do
      expect(page).to have_content(@airline1.name)
      expect(page).to_not have_content(@airline2.name)
      expect(page).to have_content(@passenger1.name, count: 1)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to_not have_content(@passenger4)
    end
  end
end 