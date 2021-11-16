# frozen_string_literal: true

class FlightPassengersController < ApplicationController
  def destroy
    pass = FlightPassenger.find_by(flight_id: params[:flight_id], passenger_id: params[:id])
    pass.destroy

    redirect_to flights_path
  end
end
