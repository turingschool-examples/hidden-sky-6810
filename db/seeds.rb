# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@airline1 = Airline.create!(name: "Backtier")
@airline2 = Airline.create!(name: "Delto")
@flight1 = @airline1.flights.create!(number: 1001, date: "11/16/21", departure_city: "Denver", arrival_city: "Los Angeles")
@flight2 = @airline1.flights.create!(number: 1002, date: "11/16/21", departure_city: "Miami", arrival_city: "Phoenix")
@flight3 = @airline1.flights.create!(number: 1003, date: "11/16/21", departure_city: "Chicago", arrival_city: "New York City")
@flight4 = @airline2.flights.create!(number: 2001, date: "11/16/21", departure_city: "Seattle", arrival_city: "San Francisco")
@flight5 = @airline2.flights.create!(number: 2002, date: "11/16/21", departure_city: "Tampa Bay", arrival_city: "Las Vegas")
@flight6 = @airline2.flights.create!(number: 2003, date: "11/16/21", departure_city: "Austin", arrival_city: "Salt Lake City")
@passenger1 = Passenger.create!(name: "Abbie Aaron", age: 27)
@passenger2 = Passenger.create!(name: "Bob Benjamin", age: 28)
@passenger3 = Passenger.create!(name: "Chris Carrey", age: 42)
@passenger4 = Passenger.create!(name: "Dexter Daring", age: 33)
@passenger5 = Passenger.create!(name: "Ester Edith", age: 24)
@passenger6 = Passenger.create!(name: "Frank Fredrick", age: 35)
@passenger7 = Passenger.create!(name: "Greg Gary", age: 32)
@passenger8 = Passenger.create!(name: "Hank Harry", age: 52)
@passenger9 = Passenger.create!(name: "Ike Izzle", age: 41)
@passenger10 = Passenger.create!(name: "Jerry Jack", age: 36)
@passenger11 = Passenger.create!(name: "Kirby Kirk", age: 37)
@passenger12 = Passenger.create!(name: "Lisa Lauren", age: 38)
@flight_passenger1 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id)
@flight_passenger2 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger2.id)
@flight_passenger3 = FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger3.id)
@flight_passenger4 = FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger4.id)
@flight_passenger5 = FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger5.id)
@flight_passenger6 = FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger6.id)
@flight_passenger7 = FlightPassenger.create!(flight_id: @flight4.id, passenger_id: @passenger7.id)
@flight_passenger8 = FlightPassenger.create!(flight_id: @flight4.id, passenger_id: @passenger8.id)
@flight_passenger9 = FlightPassenger.create!(flight_id: @flight5.id, passenger_id: @passenger9.id)
@flight_passenger10 = FlightPassenger.create!(flight_id: @flight5.id, passenger_id: @passenger10.id)
@flight_passenger11 = FlightPassenger.create!(flight_id: @flight6.id, passenger_id: @passenger11.id)
@flight_passenger12 = FlightPassenger.create!(flight_id: @flight6.id, passenger_id: @passenger12.id)