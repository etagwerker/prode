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
  
  def wrong?(forecast)
    result = false
    if forecast.result
      result = correct?(forecast)
    end
    return result
  end
  
  def result_entered?
    not self.updated_at.eql? self.created_at
  end

end


