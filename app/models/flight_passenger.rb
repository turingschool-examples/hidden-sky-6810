# frozen_string_literal: true

class FlightPassenger < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger
end
