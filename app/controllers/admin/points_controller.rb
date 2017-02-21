class Admin::PointsController < Admin::BaseController

  def new
    @point = Point.new
  end

  def create
    @point = User.find(params[:user_id]).points.create
    redirect_to admin_user_path(@point.user)
  end

  def destroy
    @point = User.find(params[:user_id]).points.last.destroy
    redirect_to admin_user_path(@point.user)
  end
end
