class FlightPassengersController < ApplicationController

  def destroy
    passenger = Passenger.find(params[:passenger_id])
    passenger.destroy

    redirect_to "/flights"
  end

end
