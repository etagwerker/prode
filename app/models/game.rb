class Game < ActiveRecord::Base
  belongs_to :home_team, :class_name => 'Team'
  belongs_to :away_team, :class_name => 'Team'
  has_many :forecasts
  include Result

  def nice_datetime
    self.datetime.strftime('%A, %B %d')
  end
  
  def short_datetime
    self.datetime.strftime('%Y-%m-%d')
  end

  def exact?(forecast)
    result = false
    if correct?(forecast)
      result = forecast.away_goals == self.away_goals && forecast.home_goals == self.home_goals
    end
    result
  end
  
  def correct?(forecast)
    result = false
    if self.result
      result = forecast.result == self.result
    end
    return result
  end
  
  # wrong is not correct :-)
  def wrong?(forecast)
    result = false
    if forecast.result
      result = !correct?(forecast)
    end
    return result
  end
  
  def result_entered?
    self.home_goals != nil && self.away_goals != nil && (not (self.updated_at.eql? self.created_at))
  end
  
  def to_label
    "#{self.home_team.to_label}-#{self.away_team.to_label}"
  end

end


