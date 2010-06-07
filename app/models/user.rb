class User < ActiveRecord::Base
  validates_uniqueness_of(:email, :message => "That email is already registered!")
  validates_uniqueness_of(:nick, :message => "That nick is already registered!")
  
  has_many :forecasts
  
  def is_admin?
    self.admin
  end
end
