class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :update, :destroy]
  before_action :validate_user, only: [:index, :create, :update, :destroy, :set_place]

  # GET /places
  def index
    @places = Place.all

    render json: @places
  end

  # GET /places/1
  def show
    render json: @place
  end

  # POST /places
  def create
    @place = current_user.places.build(place_params)
    if @place.save
      render json: @place, status: :created, location: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      render json: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
    if @place.destroy
      head :no_content
    else
      render json: @place.errors, status: :unprocessable_entity
    end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      validate_user
      @place = current_user.places.find(params[:id])
    end

    def validate_user
      set_current_user
    end

    # Only allow a trusted parameter "white list" through.
    def place_params
      params.require(:place).permit(:country, :note)
    end
end
