class Forecast < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  include Result

  # determines if this forecast was correct
  def correct?
    self.game.correct?(self)
  end
  
  # determines if this forecast was exact
  def exact?
    self.game.exact?(self)
  end
  
  def wrong?
    self.game.wrong?(self)
  end
  
  def <=>(f)
    if self.game.datetime == f.game.datetime 
      return 0
    elsif self.game.datetime > f.game.datetime
      return 1
    else
      return -1
    end
  end
  
end
