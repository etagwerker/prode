class Group < ActiveRecord::Base
  has_many :games
  has_many :teams
end
