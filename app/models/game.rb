class Game < ActiveRecord::Base
  belongs_to :visitor, class_name: "Team"
  belongs_to :local, class_name: "Team"
  belongs_to :group

  def formatted_time
    time.strftime "%a %d, %H:%M (ART)"
  end
end
