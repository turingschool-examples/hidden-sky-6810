require 'rails_helper'

RSpec.describe "Flight Index Page" do
  before :each do
    @airline1 = Airline.create!(name: "Southwest")
    @flight1 = @airline1.flights.create!(number: 1234, date: "06/06/22", departure_city: "Denver", arrival_city: "Tampa")
    @flight2 = @airline1.flights.create!(number: 1567, date: "07/02/22", departure_city: "Chicago", arrival_city: "LA")
    @passenger1 = @flight1.passengers.create!(name: "Derek", age: 37)
    @passenger2 = @flight1.passengers.create!(name: "Colt", age: 17)
    @passenger3 = @flight2.passengers.create!(name: "Larry", age: 53)
  end

  it "shows flights and their attributes" do
    visit "/flights"

    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)

    within "#id-#{@flight1.id}" do
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@airline1.name)
    end

    within "#id-#{@flight2.id}" do
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@airline1.name)
    end
  end

  it "can remove a passenger from a flight" do
    visit "/flights"
    
    click_button "Remove #{@passenger2.name}"
    expect(current_path).to eq("/flights")

    expect(page).to_not have_content(@passenger2.name)
  end
end

# User Story 2, Remove a Passenger from a Flight
#
# As a visitor
# When I visit the flights index page
# Next to each passengers name
# I see a link or button to remove that passenger from that flight
# When I click on that link/button
# I'm returned to the flights index page
# And I no longer see that passenger listed under that flight
#
# (Note: you should not destroy the passenger record entirely)
