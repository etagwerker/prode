json.array!(@forecasts) do |forecast|
  json.extract! forecast, :id, :home_goals, :away_goals, :winner_id, :tournament_id
  json.url forecast_url(forecast, format: :json)
end
