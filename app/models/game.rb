class Game < ActiveRecord::Base
  belongs_to :visitor, class: "Team"
  belongs_to :local, class: "Team"
  belongs_to :group

end
