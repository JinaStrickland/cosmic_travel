class ScientistsController < ApplicationController
  
  def index
    @scientists = Scientist.all 
  end

  def show
    @scientist = Scientist.find(params[:id])
  end

  def new 
    @scientist = Scientist.new 
  end

  def create
    @scientist = Scientist.new(scientist_param)
    if @scientist.valid?
      @scientist.save
      redirect_to scientist_path(@scientist)
    else
      render :new
    end
  end

  def edit 
    @scientist = Scientist.find(params[:id])
  end

  def update 
    @scientist = Scientist.find(params[:id])
    @scientist.update(scientist_param)
    if @scientist.valid?
        @scientist.save 
        redirect_to scientist_path(@scientist)
    else 
      render :edit 
    end
  end


  def destroy 
    Scientist.destroy(params[:id])
    redirect_to scientists_path
  end


  private

  def scientist_param
    params.require(:scientist).permit(:name, :field_of_study)
  end

end
