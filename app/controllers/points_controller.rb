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
    date_attributes = %i(start_date(1i) start_date(2i) start_date(3i) start_date(4i) start_date(5i) end_date(1i) end_date(2i) end_date(3i) end_date(4i) end_date(5i))
    params.require(:point).permit(:title, :detail, :point, :point_category, date_attributes )
  end
end
