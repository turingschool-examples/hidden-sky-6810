require 'rails_helper'

RSpec.describe "Airline Show Page" do
  before :each do
    @airline1 = Airline.create!(name: "Southwest")
    @airline2 = Airline.create!(name: "Delta")
    @flight1 = @airline1.flights.create!(number: 1234, date: "06/06/22", departure_city: "Denver", arrival_city: "Tampa")
    @flight2 = @airline1.flights.create!(number: 1567, date: "07/02/22", departure_city: "Chicago", arrival_city: "LA")
    @flight3 = @airline2.flights.create!(number: 1237, date: "01/01/22", departure_city: "Chicago", arrival_city: "NY")
    @passenger1 = @flight1.passengers.create!(name: "Derek", age: 37)
    @passenger1 = @flight2.passengers.create!(name: "Derek", age: 37)
    @passenger2 = @flight1.passengers.create!(name: "Colt", age: 17)
    @passenger3 = @flight2.passengers.create!(name: "Larry", age: 53)
    @passenger4 = @flight3.passengers.create!(name: "David", age: 19)
    @passenger5 = @flight3.passengers.create!(name: "Mark", age: 21)
  end

  it "can show all adult passengers for an airline" do
    visit "airlines/#{@airline1.id}"
    
    expect(page).to have_content(@passenger1.name)
    expect(page).to have_content(@passenger3.name)
    expect(page).to_not have_content(@passenger2.name)
    expect(page).to_not have_content(@passenger4.name)
    expect(page).to_not have_content(@passenger5.name)
  end
end
