class LocationController < ApplicationController
  before_action :set_trip
  before_action :set_location, only: [show:, edit:, update:, destroy:]

  def index
    @locations = @trip.locations
  end

  def show
  end

  def new
    @location = @trip.locations.new
  end

  def create
    @location = @trip.locations.new(location_params)
    if @location.save
      redirect_to new_location_address_path(@location)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to locations_path
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path
  end

  private
    def location_params
      params.require(:location).permit(:name, :days)
    end

    def set_location
      @location = @trip.locations.find(params[:id])
    end

    def set_trip
      @trip = Trip.find(params[:id])     
    end

end