class Reward < ApplicationRecord
  belongs_to :user


  def self.available
    self.where(taken:false)
  end

  def self.not_available
    self.where(taken:true)
  end
end
