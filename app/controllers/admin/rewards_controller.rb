class Admin::RewardsController < Admin::BaseController
  # def new
  #   @rewarder = User.find(params[:user_id]).rewards.new
  #   # byebug
  # end

  def create
    name = ("a".."z").to_a
    @reward = User.find(params[:user_id]).rewards.create(name:name.sample(4).join)
    redirect_to admin_user_path(@reward.user)
  end


# private
#   def reward_params
#     params.require(:reward).permit(:name)
#   end

end
