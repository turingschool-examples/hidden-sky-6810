class Airline < ApplicationRecord
  has_many :flights

  def self.adult_passengers
    test = Passenger.joins(:flights).where(["age >= ?", 18]).distinct.pluck(:name)
  end
end
