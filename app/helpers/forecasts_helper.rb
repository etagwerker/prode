module ForecastsHelper
  
  def get_class(forecast)
    if forecast.game.result_entered?
      if forecast.exact?
        "exact_forecast"
      elsif forecast.correct?
        "correct_forecast"
      elsif forecast.wrong?
        "wrong_forecast"
      else
        ""
      end  
    else
      ""
    end
    
  end
end
