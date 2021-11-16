# User Story 3, Airline's Passengers
#
# As a visitor
# When I visit an airline's show page
# Then I see a list of passengers that have flights on that airline
# And I see that this list is unique (no duplicate passengers)
# And I see that this list only includes adult passengers
#
# (Note: an adult is anyone with age greater than or equal to 18)
require 'rails_helper'

RSpec.describe 'airline show page' do
  before(:each) do
    @airline = Airline.create!(name: 'Test Airlines')

    @flight1 = @airline.flights.create(number: 1234, date: '08/03/22', departure_city: 'Phoenix', arrival_city: 'Tucson')
    @flight2 = @airline.flights.create(number: 4321, date: '08/04/22', departure_city: 'Denver', arrival_city: 'LA')

    @passenger1 = Passenger.create!(name: 'Chloe', age: 30)
    @passenger2 = Passenger.create!(name: 'Liam', age: 1)
    @passenger3 = Passenger.create!(name: 'Mary', age: 30)
    @passenger4 = Passenger.create!(name: 'Bri', age: 25)
    @passenger5 = Passenger.create!(name: 'Naomi', age: 30)

    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id)
    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger2.id)
    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger3.id)
    FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger3.id)
    FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger4.id)
  end

  describe 'page layout' do
    it 'has a header' do
      visit airline_path(@airline)

      expect(page).to have_content(@airline.name)
    end

    it 'shows all adult passengers' do
      visit airline_path(@airline)

      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)

      expect(page).to_not have_content(@passenger2.name)
      expect(page).to_not have_content(@passenger5.name)
    end

    it 'it does not show duplicate passengers' do
      visit airline_path(@airline)

      expect(page).to have_content(@passenger1.name, count: 1)
    end
  end
end
