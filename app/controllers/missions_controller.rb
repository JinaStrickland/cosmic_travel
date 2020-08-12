class MissionsController < ApplicationController
  def index
    @missions = Mission.all 
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def new
    @mission = Mission.new
  end

  def create 
    @mission = Mission.new(mission_param)
    if @mission.valid?
      @mission.save 
      id = @mission.scientist.id
      # redirect_to mission_path(@mission)
      redirect_to scientist_path(id)
    else
      render :new 
    end
  end

  private 

  def mission_param
    params.require(:mission).permit(:name, :scientist_id, :planet_id)
  end

end
