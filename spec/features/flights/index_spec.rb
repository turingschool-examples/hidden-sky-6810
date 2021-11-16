require 'rails_helper'

RSpec.describe 'flight index' do
  describe 'page layout' do
    it 'has a header' do
      visit flights_path

      expect(page).to have_content('All Flights')
    end
  end

  describe 'content' do
    before(:each) do
      airline = Airline.create!(name: 'Test Airlines')

      @flight1 = airline.flights.create(number: 1234, date: '08/03/22', departure_city: 'Phoenix', arrival_city: 'Tucson')
      @flight2 = airline.flights.create(number: 4321, date: '08/04/22', departure_city: 'Denver', arrival_city: 'LA')

      @passenger1 = Passenger.create!(name: 'Chloe', age: 30)
      @passenger2 = Passenger.create!(name: 'Liam', age: 1)
      @passenger3 = Passenger.create!(name: 'Mary', age: 30)

      FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id)
      FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger2.id)
      FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger3.id)
    end

    it 'shows all flight numbers and airline names' do
      visit flights_path

      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@flight1.airline.name)
      expect(page).to have_content(@flight2.number)
      expect(page).to have_content(@flight2.airline.name)
    end

    it 'shows passengers' do
      visit flights_path

      within "#flight-#{@flight1.id}" do
        expect(page).to have_content(@passenger1.name)
        expect(page).to have_content(@passenger2.name)
      end

      within "#flight-#{@flight2.id}" do
        expect(page).to have_content(@passenger3.name)
      end
    end

    it 'has delete buttons' do
      visit flights_path

      click_button 'Remove Mary'

      expect(page).to_not have_content(@passenger3.name)
    end
  end
end
