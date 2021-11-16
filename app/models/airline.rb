class Airline < ApplicationRecord
  has_many :flights, dependent: :destroy
  has_many :passengers, through: :flights
  validates_presence_of :name

  def unique_adults
    passengers.group("passengers.id").where("age >= ?", 18).distinct
  end
end
