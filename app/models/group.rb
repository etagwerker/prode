class Group < ActiveRecord::Base
  has_many :teams
  validates_uniqueness_of :name, :message => "A group with that name already exists"
  
  def to_s 
    self.name
  end
end
