class User < ApplicationRecord
  has_secure_password
  has_many :points
  has_many :rewards

  enum role: [:default, :admin]


  def unredeemed
    self.points.where(point_status: true)
  end

  def redeemed
    self.points.where(point_status: false)
  end

  def rewards_owned
    self.rewards.where(taken:true)
  end

end
