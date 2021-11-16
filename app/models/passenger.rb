# frozen_string_literal: true

class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers
end
