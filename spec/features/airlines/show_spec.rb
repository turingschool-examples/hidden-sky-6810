require 'rails_helper'

RSpec.describe "Airline Show Page" do
  before :each do
    @airline1 = Airline.create!(name: "Southwest")
    @flight1 = @airline1.flights.create!(number: 1234, date: "06/06/22", departure_city: "Denver", arrival_city: "Tampa")
    @flight2 = @airline1.flights.create!(number: 1567, date: "07/02/22", departure_city: "Chicago", arrival_city: "LA")
    @passenger1 = @flight1.passengers.create!(name: "Derek", age: 37)
    @passenger1 = @flight2.passengers.create!(name: "Derek", age: 37)
    @passenger2 = @flight1.passengers.create!(name: "Colt", age: 17)
    @passenger3 = @flight2.passengers.create!(name: "Larry", age: 53)
  end

  it "can show all adult passengers for an airline" do
    visit "airlines/#{@airline1.id}"

    expect(page).to have_content(@passenger1.name)
    expect(page).to have_content(@passenger3.name)
    expect(page).to_not have_content(@passenger2.name)
  end
end
