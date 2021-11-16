class Airline < ApplicationRecord
  has_many :flights

  def adult_passengers
    test = Passenger.joins(:flights).where(["age >= ?", 18]).distinct.pluck(:name)

  end
end

#Things I tried to make this for only 1 airline
#self.adult_passengers
#.group(:id)
#adding airline id into the where
