class CitizenLakesController < ApplicationController
  before_action :set_citizen_lake, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @citizen_lakes = CitizenLake.all
    respond_with(@citizen_lakes)
  end

  def show
    respond_with(@citizen_lake)
  end

  def new
    @citizen_lake = CitizenLake.new
    respond_with(@citizen_lake)
  end

  def edit
  end

  def create
    @citizen_lake = CitizenLake.new(citizen_lake_params)
    @citizen_lake.save
    respond_with(@citizen_lake)
  end

  def update
    @citizen_lake.update(citizen_lake_params)
    respond_with(@citizen_lake)
  end

  def destroy
    @citizen_lake.destroy
    respond_with(@citizen_lake)
  end

  private
    def set_citizen_lake
      @citizen_lake = CitizenLake.find(params[:id])
    end

    def citizen_lake_params
      params.require(:citizen_lake).permit(:previous_year, :lake_id, :citizen_id)
    end
end
