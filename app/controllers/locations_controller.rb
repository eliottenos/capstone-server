class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]
  before_action :validate_user, only: [:index, :create, :update, :destroy, :set_location]

  # GET /locations
  def index
    @locations = Location.all

    render json: @locations
  end

  # GET /locations/1
  def show
    render json: @location
  end

  # POST /locations
  def create
    @location = current_user.locations.build(location_params)

    if @location.save
      render json: @location, status: :created, location: @location
      # render json: @location, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  def destroy
    # @location = current_user.locations.destroy
    @location.destroy
    if @location.destroy
      # render json: @location, status: :destroyed
      head :no_content
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end
  #   if current_location == Location.find(params[:id])
  #     current_locations.destroy
  #   head :no_content
  # end
# end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      validate_user
      @location = current_user.locations.find(params[:id])
    end

    def validate_user
      set_current_user
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(:country, :visited, :note)
    end
  end
