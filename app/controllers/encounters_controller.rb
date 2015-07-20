class EncountersController < ApplicationController
  before_action :set_encounter, only: [:show, :edit, :update, :destroy]

  def index
    @encounters = Encounter.all
  end

  def show
  end

  def new
    @encounter = Encounter.new
  end

  def edit
  end

  def create
    @encounter = Encounter.new(encounter_params)
    if @encounter.save
      redirect_to @encounter, notice: 'Encounter was successfully created.'
    else
      render :new
    end
  end

  def update
    if @encounter.update(encounter_params)
      redirect_to @encounter, notice: 'Encounter was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @encounter.destroy
    redirect_to encounters_url, notice: 'Encounter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encounter
      @encounter = Encounter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encounter_params
      params.require(:encounter).permit(:campaign_id, :name)
    end
end
