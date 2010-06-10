class User < ActiveRecord::Base
  validates_uniqueness_of(:email, :message => "That email is already registered!")
  validates_uniqueness_of(:nick, :message => "That nick is already registered!")

  attr_accessor :password # virtual field
  
  has_many :forecasts
  has_one :top_four
  
  def is_admin?
    self.admin
  end
  
  def total_score
    exact_score.to_i + correct_score.to_i
  end
end
