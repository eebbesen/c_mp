class CitizensController < ApplicationController
  before_action :set_citizen, only: [:show, :edit, :update, :destroy]

  # GET /citizens
  # GET /citizens.json
  def index
    @citizens = Citizen.where(id: current_citizen)
    # redirect_to citizens_path, action: show, id: current_citizen
    # this is giving infinite loop (according to chrome)
  end

  # GET /citizens/1
  # GET /citizens/1.json
  def show
  end

  # GET /citizens/new
  def new
    @citizen = Citizen.new
  end

  # GET /citizens/1/edit
  def edit
  end

  # POST /citizens
  # POST /citizens.json
  def create
    @citizen = Citizen.new(citizen_params)

    respond_to do |format|
      if @citizen.save
        format.html { redirect_to @citizen, notice: 'Citizen was successfully created.' }
        format.json { render :show, status: :created, location: @citizen }
      else
        format.html { render :new }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citizens/1
  # PATCH/PUT /citizens/1.json
  def update
    respond_to do |format|
      if @citizen.update(citizen_params)
        format.html { redirect_to @citizen, notice: 'Citizen was successfully updated.' }
        format.json { render :show, status: :ok, location: @citizen }
      else
        format.html { render :edit }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citizens/1
  # DELETE /citizens/1.json
  def destroy
    @citizen.destroy
    respond_to do |format|
      format.html { redirect_to citizens_url, notice: 'Citizen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citizen
      @citizen = current_citizen
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def citizen_params
      params.require(:citizen).permit(:first_name, :last_name, :clmp_number, :email, 
        :phone_1, :phone_2, :password, :password_confirmation)
    end
end
