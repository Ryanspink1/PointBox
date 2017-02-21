class RewardsController < ApplicationController
  def update
    user = User.find(params[:id])
    if (user.unredeemed.count >= 1) && (Reward.available.count >= 1)
      user.unredeemed.first.update(point_status: false)
      Reward.available.first.update(taken: true)
        redirect_to user_path(user)
    else
      flash[:notice] = "Not enough points or no rewards available!"
      redirect_to user_path(user)
    end
  end

end
