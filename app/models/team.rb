class Team < ActiveRecord::Base
  validates_presence_of(:group, :message => "A team must belong to a group!")
  
  belongs_to :group
  has_many :games
  
  def to_s
    self.name.capitalize
  end
  
  def to_label
    name.downcase.gsub(/[^a-z0-9]+/i, '-')    
  end
  
end
