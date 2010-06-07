module Result
  def before_save
    self.result = result_label
  end
  
  def result_label
    if home_goals == away_goals
      TIE
    elsif home_goals > away_goals
      HOME
    else
      AWAY
    end
  end
end