class PointsController < ApplicationController
  def index
    @points = Point.all
  end

  def new
    @point = Point.new
  end

  def show
    @point = Point.find(params[:id])
  end

  def edit
    @point = Point.find(params[:id])
  end

  def create
    @point = Point.new(point_params)
    if @point.save
      redirect_to @point, notice: 'Point was successfully created.' 
    else
      render :new 
    end
  end

  def update
    @point = Point.find(params[:id])
    if @point.update(point_params)
      redirect_to @point, notice: 'point was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @point = Point.find(params[:id])
    @point.destroy
    redirect_to points_url, notice: 'point was successfully destroyed.'
  end

  private
  def point_params
    params.require(:point).permit(:title, :detail, :point)
  end
end
