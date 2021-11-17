require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it {should have_many :flights}
    it { should have_many :passengers }
  end

  describe "models" do
    it "can find all unique adult passengers" do
      airline1 = Airline.create!(name: "Southwest")
      airline2 = Airline.create!(name: "Delta")
      flight1 = airline1.flights.create!(number: 1234, date: "06/06/22", departure_city: "Denver", arrival_city: "Tampa")
      flight2 = airline1.flights.create!(number: 1567, date: "07/02/22", departure_city: "Chicago", arrival_city: "LA")
      flight3 = airline2.flights.create!(number: 1237, date: "01/01/22", departure_city: "Chicago", arrival_city: "NY")
      passenger1 = Passenger.create!(name: "Derek", age: 37)
      passenger2 = Passenger.create!(name: "Colt", age: 17)
      passenger3 = Passenger.create!(name: "Larry", age: 53)
      passenger4 = Passenger.create!(name: "David", age: 19)
      passenger5 = Passenger.create!(name: "Mark", age: 21)
      fp1 = FlightPassenger.create!(flight: flight1, passenger: passenger1)
      fp2 = FlightPassenger.create!(flight: flight2, passenger: passenger1)
      fp3 = FlightPassenger.create!(flight: flight1, passenger: passenger2)
      fp4 = FlightPassenger.create!(flight: flight1, passenger: passenger3)
      fp5 = FlightPassenger.create!(flight: flight3, passenger: passenger4)
      fp5 = FlightPassenger.create!(flight: flight3, passenger: passenger5)

      expect(airline1.adult_passengers).to eq([passenger1.name, passenger3.name])
    end
  end
end
