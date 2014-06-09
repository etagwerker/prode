class Team < ActiveRecord::Base
  extend FriendlyId

  belongs_to :group

  friendly_id :name, use: :slugged

  def to_s
    self.name
  end
end
