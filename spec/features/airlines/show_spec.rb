require 'rails_helper'

RSpec.describe "Airline Show Page" do
  before :each do
    @airline1 = Airline.create!(name: "Southwest")
    @airline2 = Airline.create!(name: "Delta")
    @flight1 = @airline1.flights.create!(number: 1234, date: "06/06/22", departure_city: "Denver", arrival_city: "Tampa")
    @flight2 = @airline1.flights.create!(number: 1567, date: "07/02/22", departure_city: "Chicago", arrival_city: "LA")
    @flight3 = @airline2.flights.create!(number: 1237, date: "01/01/22", departure_city: "Chicago", arrival_city: "NY")
    @passenger1 = Passenger.create!(name: "Derek", age: 37)
    @passenger2 = Passenger.create!(name: "Colt", age: 17)
    @passenger3 = Passenger.create!(name: "Larry", age: 53)
    @passenger4 = Passenger.create!(name: "David", age: 19)
    @passenger5 = Passenger.create!(name: "Mark", age: 21)
    @fp1 = FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
    @fp2 = FlightPassenger.create!(flight: @flight2, passenger: @passenger1)
    @fp3 = FlightPassenger.create!(flight: @flight1, passenger: @passenger2)
    @fp4 = FlightPassenger.create!(flight: @flight1, passenger: @passenger3)
    @fp5 = FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
    @fp5 = FlightPassenger.create!(flight: @flight3, passenger: @passenger5)
  end

  it "can show all adult passengers for an airline" do
    visit "airlines/#{@airline1.id}"
    
    expect(page).to have_content(@passenger1.name, count: 1)
    expect(page).to have_content(@passenger3.name)
    expect(page).to_not have_content(@passenger2.name)
    expect(page).to_not have_content(@passenger4.name)
    expect(page).to_not have_content(@passenger5.name)
  end
end
